import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerice/view/Home/HomeScreen.dart';
import 'package:ecommerice/view/cart/HomeCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../const.dart';
import '../view/Profile/ProfileHomeScreen.dart';

class Navigationbar extends StatefulWidget {
  int _page = 0;

  @override
  State<Navigationbar> createState() => _NavigationbarState();

  Navigationbar({
    required int page,
  }) : _page = page;
}

class _NavigationbarState extends State<Navigationbar> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
          return PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: [
              HomeScreen(),
              HomeCart(Price: 0),
              ProfileHomeScreen(),
            ],
          );
        },

      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 70,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 30,
        curve: Curves.easeIn,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: SvgPicture.asset("assests/icon/Icon_Explore.svg", width: 25),
            title: Text('Explore'),
            activeColor: Green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset(
              "assests/icon/Icon_Cart.svg",
              width: 25,
            ),
            title: Text('Cart'),
            activeColor: Green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset(
              "assests/icon/Icon_User.svg",
              width: 25,
            ),
            title: Text('Profile'),
            activeColor: Green,
            textAlign: TextAlign.center,
          ),
        ],
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
