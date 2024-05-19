// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:barter/constant/color.dart';
import 'package:barter/screens/home.dart';
import 'package:barter/screens/member/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Tabview extends StatelessWidget {
  const Tabview({super.key});

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomePage(),
          item: ItemConfig(
            icon: const Icon(Iconsax.home_hashtag),
            title: ("หน้าหลัก"),
            activeForegroundColor: Constants.orange,
            inactiveForegroundColor: Constants.grey,
          ),
        ),
        PersistentTabConfig(
          screen: const HomePage(),
          item: ItemConfig(
            icon: const Icon(Iconsax.wallet),
            title: ("กระเป๋า"),
            activeForegroundColor: Constants.orange,
            inactiveForegroundColor: Constants.grey,
          ),
        ),
        PersistentTabConfig(
          screen: const HomePage(),
          item: ItemConfig(
            icon: const Icon(Iconsax.category),
            title: ("สินค้า"),
            activeForegroundColor: Constants.orange,
            inactiveForegroundColor: Constants.grey,
          ),
        ),
        PersistentTabConfig(
          screen: const HomePage(),
          item: ItemConfig(
            icon: const Icon(Iconsax.heart),
            title: ("ลิสของฉัน"),
            activeForegroundColor: Constants.orange,
            inactiveForegroundColor: Constants.grey,
          ),
        ),
        PersistentTabConfig(
          screen: SignIn(),
          item: ItemConfig(
            icon: const Icon(Iconsax.profile),
            title: ("บัญชีของฉัน"),
            activeForegroundColor: Constants.orange,
            inactiveForegroundColor: Constants.grey,
          ),
        )
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style4BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      );
}

// class BottomNav extends StatelessWidget {
//   const BottomNav({super.key});

//   @override
//   Widget build(BuildContext context) {

//     List<PersistentTabConfig> _tabs() {
//       return [
//         PersistentTabConfig(
//           screen: const HomePage(),
//           item: ItemConfig(
//             icon: const Icon(Iconsax.home_hashtag),
//             title: ("หน้าหลัก"),
//             activeForegroundColor: Constants.orange,
//             inactiveForegroundColor: Constants.grey,
//           ),
//         ),
//         PersistentTabConfig(
//           screen: const HomePage(),
//           item: ItemConfig(
//             icon: const Icon(Iconsax.wallet),
//             title: ("กระเป๋า"),
//             activeForegroundColor: Constants.orange,
//             inactiveForegroundColor: Constants.grey,
//           ),
//         ),
//         PersistentTabConfig(
//           screen: const HomePage(),
//           item: ItemConfig(
//             icon: const Icon(Iconsax.category),
//             title: ("สินค้า"),
//             activeForegroundColor: Constants.orange,
//             inactiveForegroundColor: Constants.grey,
//           ),
//         ),
//         PersistentTabConfig(
//           screen: const HomePage(),
//           item: ItemConfig(
//             icon: const Icon(Iconsax.heart),
//             title: ("ลิสของฉัน"),
//             activeForegroundColor: Constants.orange,
//             inactiveForegroundColor: Constants.grey,
//           ),
//         ),
//         PersistentTabConfig(
//           screen: SignIn(),
//           item: ItemConfig(
//             icon: const Icon(Iconsax.profile),
//             title: ("บัญชีของฉัน"),
//             activeForegroundColor: Constants.orange,
//             inactiveForegroundColor: Constants.grey,
//           ),
//         ),
//       ];
//     }
//     @override
//   Widget build(BuildContext context) => PersistentTabView(
//         tabs: _tabs(),
//         navBarBuilder: (navBarConfig) => Style1BottomNavBar(
//           navBarConfig: navBarConfig,
//         ),
//       );
//     // return PersistentTabView(
//     //   context,
//     //   controller: _controller,
//     //   screens: _buildScreens(),
//     //   items: _navBarsItems(),
//     //   confineInSafeArea: true,
//     //   backgroundColor: Colors.white, // Default is Colors.white.
//     //   handleAndroidBackButtonPress: true, // Default is true.
//     //   resizeToAvoidBottomInset:
//     //       false, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//     //   stateManagement: true, // Default is true.
//     //   hideNavigationBarWhenKeyboardShows:
//     //       true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//     //   decoration: NavBarDecoration(
//     //     borderRadius: BorderRadius.circular(10.0),
//     //     colorBehindNavBar: Colors.white,
//     //   ),
//     //   popAllScreensOnTapOfSelectedTab: true,
//     //   popActionScreens: PopActionScreensType.all,
//     //   itemAnimationProperties: const ItemAnimationProperties(
//     //     // Navigation Bar's items animation properties.
//     //     duration: Duration(milliseconds: 200),
//     //     curve: Curves.ease,
//     //   ),
//     //   screenTransitionAnimation: const ScreenTransitionAnimation(
//     //     // Screen transition animation on change of selected tab.
//     //     animateTabTransition: true,
//     //     curve: Curves.ease,
//     //     duration: Duration(milliseconds: 200),
//     //   ),
//     //   navBarStyle:
//     //       NavBarStyle.style3, // Choose the nav bar style with this property.
//     // );
//   }
// }
