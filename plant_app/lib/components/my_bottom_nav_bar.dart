import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:plant_app/pages/cart_page.dart';
import 'package:plant_app/pages/profile_page.dart';
import 'package:plant_app/pages/search_page.dart';
import 'package:plant_app/pages/wishlist%20page.dart';
import 'package:plant_app/screens/sidebar/configuration.dart';

import '../pages/home_page.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  int _selectedIndex = 0;

  void navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    // homepage
    HomePage(),

    //wishlist page
    Wishlist(),

    //search
    Search(),

    //cart
    Cart(),

    //profile
    Profile(),
  ];
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70, // Set the background color to white
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        child: GNav(
          haptic: true,
          curve: Curves.easeInToLinear,
          backgroundColor: Colors.white70,
          color: primaryGreen,
          activeColor: Colors.green.shade900,
          tabBackgroundColor: Colors.green.shade100,
          gap: 8,
          iconSize: 25,
          onTabChange: (index) {
            print(index);
          },
          padding: EdgeInsets.all(16),
          tabs: const [
            GButton(
              icon: Icons.home_filled,
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Wishlist',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Cart',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
