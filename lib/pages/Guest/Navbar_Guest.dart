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

class GuestNavBar extends StatefulWidget {
  const GuestNavBar({Key? key}) : super(key: key);

  @override
  State<GuestNavBar> createState() => _GuestNavBarState();
}

class _GuestNavBarState extends State<GuestNavBar> {
  int _selectedIndex = 4;

  final List<Widget> _screens = [
    GuestProfilePage(),
    const NotificationPageGuest(),
    const GuestQRCode(),
    const GuestOffers(),
    const GuestHome(),
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
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
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
          elevation: 10,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}