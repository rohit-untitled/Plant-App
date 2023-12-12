import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/home/components/body.dart';
import 'package:plant_app/screens/sidebar/configuration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 60 : 0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 20.0,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            // color: kPrimaryColor,
            color: primaryGreen,
            child: SafeArea(
              child: Container(
                color: primaryGreen,
                child: Row(
                  children: [
                    isDrawerOpen
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                scaleFactor = 1;
                                isDrawerOpen = false;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                xOffset = 280;
                                yOffset = 170;
                                scaleFactor = 0.7;
                                isDrawerOpen = true;
                              });
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/menu.svg",
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Body()),
          MyBottomNavBar(),
        ],
      ),
    );
  }
}
