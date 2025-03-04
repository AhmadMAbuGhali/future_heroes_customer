import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/pages/home/home_screen.dart';
import 'package:future_heroes_customer/pages/offer/offer_page.dart';
import 'package:future_heroes_customer/pages/profile/profile_page.dart';
import 'package:future_heroes_customer/pages/qr_code/qr_code.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:get/get.dart';

import '../notification/notification.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({Key? key}) : super(key: key);

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  int _selectedIndex = 4;

  final List<Widget> _screens = [
    const ProfilePage(),
    const NotificationPage(),
    QRCode(),
    const OfferPage(),
    HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> _navBarsItems() {
    return [
      _buildNavItem(IconAssets.user, "user".tr),
      _buildNavItem(IconAssets.notifications, "notification".tr),
      _buildNavItem(IconAssets.qr_code, "qrCode".tr),
      _buildNavItem(IconAssets.localoffer, "offer".tr),
      _buildNavItem(IconAssets.home, "home".tr),
    ];
  }

  BottomNavigationBarItem _buildNavItem(String assetPath, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(assetPath, height: 24, width: 24, color: Colors.grey),
      activeIcon: SvgPicture.asset(assetPath, height: 24, width: 24, color: ColorManager.primary),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 1),
          ],
        ),
        child: BottomNavigationBar(
          items: _navBarsItems(),
          currentIndex: _selectedIndex,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0, // تقليل الظل لمطابقة `style3`
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}