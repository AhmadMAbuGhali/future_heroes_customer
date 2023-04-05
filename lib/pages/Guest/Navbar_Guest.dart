import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/pages/Guest/GuestHome.dart';
import 'package:future_heroes_customer/pages/Guest/Guest_Offers.dart';
import 'package:future_heroes_customer/pages/Guest/Guest_profile_page.dart';
import 'package:future_heroes_customer/pages/Guest/Guest_qr_code.dart';
import 'package:future_heroes_customer/pages/Guest/NotificationPageGuest.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class GuestNavBar extends StatefulWidget {
  const GuestNavBar({Key? key}) : super(key: key);

  @override
  State<GuestNavBar> createState() => _GuestNavBarState();
}

class _GuestNavBarState extends State<GuestNavBar> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 4);
  }

  List<Widget> _buildScreens() {
    return [
      GuestProfilePage(),
      const NotificationPageGuest(),
      const GuestQRCode(),
      const GuestOffers(),
      const GuestHome()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.user),
        title: ("user".tr),
        iconSize: 70,
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.notifications),
        title: ("notification".tr),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.qr_code),
        title: ("qrCode".tr),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.localoffer),
        title: ("offer".tr),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.home),
        title: ("home".tr),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
