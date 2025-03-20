import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:meditation_friend_app/common/services/storage.dart';
import 'package:meditation_friend_app/common/utils/environment.dart';
import 'package:meditation_friend_app/common/utils/kstrings.dart';
import 'package:meditation_friend_app/common/widgets/error_modal.dart';
import 'package:meditation_friend_app/src/auth/models/profile_model.dart';
import 'package:meditation_friend_app/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:provider/provider.dart';

class AuthNotifier with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void loginFunc(String data, BuildContext ctx) async {
    print(data);
    var sessionId;
    setLoading();

    try {
      // 1. CSRF 토큰 획득
      var url_token = Uri.parse(
        '${Environment.appBaseUrl}/api/setting/set-csrf',
      );
      final response_token = await http.get(url_token);
      final csrfToken =
          response_token.headers['set-cookie']
              ?.split(';')
              .firstWhere((cookie) => cookie.startsWith('csrftoken='))
              ?.split('=')
              .last;
      print('url_token: ${url_token}');
      // 로그인 요청
      var url = Uri.parse('${Environment.appBaseUrl}/api/setting/login');
      var loginResponse = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken': csrfToken ?? '',
          'Cookie': 'csrftoken=$csrfToken',
        },
        body: data,
      );

      // 4. access token 추출
      if (loginResponse.statusCode == 200) {
        // 3. 세션 ID 추출
        if (loginResponse.headers['set-cookie'] != null) {
          var cookies = loginResponse.headers['set-cookie']!.split(',');
          var sessionCookie = cookies.firstWhere(
            (cookie) => cookie.trim().startsWith('sessionid='),
            orElse: () => '',
          );
          if (sessionCookie.isNotEmpty) {
            sessionId = sessionCookie.split(';').first.split('=')[1];
            Storage().setString('sessionId', sessionId);
          } else {
            print('Session ID not found.');
          }
        } else {
          print('No Set-Cookie header found.');
        }
        await getUser(sessionId, ctx);
        setLoading();
        ctx.read<TabIndexNotifier>().setIndex(0);
        ctx.go('/home');
      } else if (loginResponse.statusCode == 400) {
        print("비밀번호가 틀려요!");
        setLoading();
      }
    } catch (e) {
      setLoading();
      print(e);
      showErrorPopup(ctx, AppText.kErrorLogin, null, null);
    }
  }

  void registrationFunc(String data, BuildContext ctx) async {
    setLoading();
    try {
      var url = Uri.parse('${Environment.appBaseUrl}/api/setting/register');
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: data,
      );

      if (response.statusCode == 201) {
        ctx.go('/login');
        setLoading();
      } else if (response.statusCode == 400) {
        setLoading();
        var data = jsonDecode(response.body);
        showErrorPopup(ctx, data['password'][0], null, null);
      }
    } catch (e) {
      setLoading();
      showErrorPopup(ctx, AppText.kErrorLogin, null, null);
    }
  }

  Future<void> getUser(String sessionId, BuildContext ctx) async {
    try {
      // 1 사용자 정보 요청
      var url = Uri.parse(
        '${Environment.appBaseUrl}/api/setting/get-user-info',
      );
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Cookie': 'sessionid=$sessionId',
        },
      );
      if (response.statusCode == 200) {
        // 2. 응답 데이터 처리
        var responseData = jsonDecode(response.body);
        if (responseData['isAuthenticated']) {
          // var userId = responseData['userId'];
          // var username = responseData['user'];

          Storage().setString('userInfo', response.body);
        } else {
          // 인증되지 않은 사용자 처리
          // 예: 로그인 페이지로 리다이렉트
        }
      } else {
        // 서버 오류 처리
        print('서버 오류: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      showErrorPopup(ctx, AppText.kErrorLogin, null, null);
    }
  }

  ProfileModel? getUserData() {
    String? sessionId = Storage().getString('sessionId');

    if (sessionId != null) {
      var data = Storage().getString('userInfo');
      if (data != null && data.isNotEmpty) {
        return profileModelFromJson(data);
      } else {
        // 데이터가 null이거나 비어있을 경우 처리 (예: 로그인 화면으로 리다이렉션 등)
        print('User data is not available or empty.');
        return null;
      }
    }
  }
}
