import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:meditation_friend_app/common/widgets/back_button.dart';
import 'package:meditation_friend_app/common/widgets/custom_button.dart';
import 'package:meditation_friend_app/common/widgets/email_textfield.dart';
import 'package:meditation_friend_app/common/widgets/password_field.dart';
import 'package:meditation_friend_app/src/auth/contollers/auth_notifier.dart';
import 'package:meditation_friend_app/src/auth/models/login_model.dart';
import 'package:meditation_friend_app/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _usernameController =
      TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  final FocusNode _passwordNode = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kSkyBlue,
      appBar: AppBar(
        backgroundColor: Kolors.kSkyBlue,
        elevation: 0,
        leading: AppBackButton(
          onTap: () {
            if (context.mounted) {
              context.read<TabIndexNotifier>().setIndex(0);
              context.go('/home');
            }
          },
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 160),
          Text(
            '명상친구',
            textAlign: TextAlign.center,
            style: appStyle(24, Kolors.kPrimary, FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '같이 해요. 마음챙김 명상.',
            textAlign: TextAlign.center,
            style: appStyle(13, Kolors.kGray, FontWeight.normal),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                EmailTextField(
                  radius: 25,
                  focusNode: _passwordNode,
                  hintText: "Username",
                  controller: _usernameController,
                  prefixIcon: const Icon(
                    CupertinoIcons.profile_circled,
                    size: 20,
                    color: Kolors.kGray,
                  ),
                  keyboardType: TextInputType.name,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_passwordNode);
                  },
                ),
                SizedBox(height: 25),
                PasswordField(
                  controller: _passwordController,
                  focusNode: _passwordNode,
                  radius: 25,
                ),
                SizedBox(height: 25),
                context.watch<AuthNotifier>().isLoading
                    ? const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Kolors.kPrimary,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Kolors.kWhite,
                        ),
                      ),
                    )
                    : GradientBtn(
                      onTap: () {
                        LoginModel model = LoginModel(
                          password: _passwordController.text,
                          username: _usernameController.text,
                        );

                        String data = loginModelToJson(model);
                        // print(data); // {"password":"1234","username":"admin"}
                        context.read<AuthNotifier>().loginFunc(data, context);
                      },
                      text: "시작하기",
                      btnWidth: ScreenUtil().screenWidth,
                      btnHieght: 40,
                      radius: 20,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
