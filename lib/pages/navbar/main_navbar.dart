import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/pages/profile/profile_page.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/utils/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({Key? key}) : super(key: key);

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;

  List pages = [
    Container(
      child: Center(child: Text('NextPage 1')),
    ),
    Container(
      child: Center(child: Text('NextPage 2 ')),
    ),
    Container(
      child: Center(child: Text('NextPage 3')),
    ),
    Container(
      child: Center(child: Text('NextPage 4')),
    ),
    Container(
      child: Center(child: Text('NextPage 5')),
    ),
  ];

  void onTapNav(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);

  }

  List<Widget> _buildScreens() {
    return [
      ProfilePage(),
      Container(
        child: Center(child: Text('NextPage 2 ')),
      ),
      Container(
        child: Center(child: Text('NextPage 3')),
      ),
      Container(
        child: Center(child: Text('NextPage 4')),
      ),Container(
        child: Center(child: Text('NextPage 5')),
      ),

    ];
  }


  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.user),
        title: ("المستحدم"),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.transparent,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.notifications),
        title: ("الاشعارات"),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.transparent,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.qr_code),
        title: ("QR Code"),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.transparent,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.localoffer),
        title: ("العروض"),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.transparent,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(IconAssets.home),
        title: ("الرئيسية"),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.transparent,
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
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      selectedFontSize: 0.0,
      unselectedFontSize: 0.0,
      currentIndex: _selectedIndex,
      onTap: onTapNav,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home Page"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive),
              label: "history"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "cart "
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "me"
          ),
        ],
      ),
    );
  }*/
}
