import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/pages/cart_page.dart';
import 'package:plant_app/pages/home_page.dart';
import 'package:plant_app/pages/profile_page.dart';
import 'package:plant_app/pages/search_page.dart';
import 'package:plant_app/pages/wishlist%20page.dart';
import 'package:plant_app/screens/sidebar/components/info_cards.dart';
import 'package:plant_app/screens/sidebar/configuration.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryGreen,
      padding: EdgeInsets.only(top: 70, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const InfoCard(name: 'Rohit Sharma', profession: 'Not a Cricketer'),
          buildDrawerList(),
          buildLogoutSettingsRow(),
        ],
      ),
    );
  }

  Widget buildDrawerList() {
    return Column(
      children: drawerItems
          .asMap()
          .entries
          .map((MapEntry<int, Map<String, dynamic>> entry) {
        final int index = entry.key;
        final Map<String, dynamic> element = entry.value;
        return buildListTile(index, element['icon'], element['title'], () {
          print('Item tapped: $index');
        });
      }).toList(),
    );
  }

  Widget buildLogoutSettingsRow() {
    return Row(
      children: [
        buildIconTextRow(Icons.settings, 'Setting'),
        buildDivider(),
        buildIconTextRow(Icons.logout_rounded, 'Logout'),
      ],
    );
  }

  Widget buildIconTextRow(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white60,
            size: 30,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: drawerTextStyle,
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Container(
        width: 2,
        height: 30,
        color: Colors.white60,
      ),
    );
  }

  AnimatedPositioned buildListTile(
      int index, IconData icon, String title, VoidCallback onTap) {
    return AnimatedPositioned(
      duration: animationDuration,
      curve: Curves.easeInOut,
      height: 56,
      width: _selectedIndex == index ? 288 : 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Color.fromARGB(255, 97, 150, 150)
                : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            boxShadow: _selectedIndex == index
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          child: ListTile(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              navigateToPage(index);
              onTap();
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
            leading: SizedBox(
              height: 34,
              width: 34,
              child: Icon(
                icon,
                size: 32,
                color: _selectedIndex == index ? Colors.white : Colors.white60,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                title,
                style: TextStyle(
                  color:
                      _selectedIndex == index ? Colors.white : Colors.white60,
                  fontSize: 18,
                  fontWeight: _selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigateToPage(int index) {
    // Implement your navigation logic here based on the selected item
    switch (index) {
      case 0:
        // Navigate to Home page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        // Navigate to Search page
        Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
        break;
      case 2:
        // Navigate to Search page
        Navigator.push(context, MaterialPageRoute(builder: (context) => Wishlist()));
        break;
      case 3:
        // Navigate to Search page
        Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
        break;
      case 4:
        // Navigate to Search page
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Notification()));
        break;
    
      case 5:
        // Navigate to Search page
        Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
        break;
    }
  }
}
