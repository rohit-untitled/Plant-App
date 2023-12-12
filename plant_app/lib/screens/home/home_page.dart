// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:plant_app/constants.dart';
// import 'package:plant_app/screens/home/components/body.dart';
// import 'package:plant_app/screens/sidebar/screens/home_screen.dart';
// import '../../components/my_bottom_nav_bar.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(),
//       body: Body(),
//       bottomNavigationBar: const MyBottomNavBar(),
//     );
//   }

//   AppBar buildAppBar() {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: kPrimaryColor,
//       leading: IconButton(
//         icon: SvgPicture.asset("assets/icons/menu.svg"),
//         onPressed: () {},
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/home/components/body.dart';
import 'package:plant_app/screens/sidebar/screens/home_screen.dart';
import '../../components/my_bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            buildAppBar(),
            Expanded(child: Body()),
            MyBottomNavBar(),
          ],
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
    );
  }
}
