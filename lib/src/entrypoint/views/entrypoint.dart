import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/src/cart/views/cart_screen.dart';
import 'package:meditation_friend_app/src/home/views/home_screen.dart';
import 'package:meditation_friend_app/src/profile/views/profile_screen.dart';
import 'package:meditation_friend_app/src/wishlist/views/wishlist_screen.dart';

class AppEntryPoint extends StatelessWidget {
  AppEntryPoint({super.key});
  // 여기에 네 개의 탭이 와야함
  List<Widget> pageList = [
    const HomePage(),
    const WishlistPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pageList[1],
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Kolors.kOffWhite),
              child: BottomNavigationBar(
                selectedFontSize: 12,
                elevation: 0,
                backgroundColor: Kolors.kOffWhite,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                unselectedIconTheme: const IconThemeData(color: Colors.black38),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      AntDesign.home,
                      color: Kolors.kPrimary,
                      size: 24,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      AntDesign.home,
                      color: Kolors.kPrimary,
                      size: 24,
                    ),
                    label: "Wishlist",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      AntDesign.home,
                      color: Kolors.kPrimary,
                      size: 24,
                    ),
                    label: "Cart",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      AntDesign.home,
                      color: Kolors.kPrimary,
                      size: 24,
                    ),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
