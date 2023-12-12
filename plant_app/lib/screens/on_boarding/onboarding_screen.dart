import 'package:flutter/material.dart';
import 'package:plant_app/components/default_button.dart';
// import 'package:plant_app/screens/home/components/body.dart';
import 'package:plant_app/screens/home/home_page.dart';
import 'package:plant_app/screens/log_in/components/auth_page.dart';
import 'package:plant_app/screens/on_boarding/screens/intro1.dart';
import 'package:plant_app/screens/on_boarding/screens/intro2.dart';
import 'package:plant_app/screens/on_boarding/screens/intro3.dart';
import 'package:plant_app/screens/sidebar/body.dart';
import 'package:plant_app/screens/sidebar/screens/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  // controller to keep track on
  PageController _controller = PageController();

  // if we are on the last page or not
  bool onLastPage = false;

  // Function to navigate to HomePage
  // void navigateToHomePage() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) {
  //       return HomeScreen();
  //     }),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              Intro1(),
              Intro2(),
              Intro3(),
            ],
          ),

          // SmoothPageIndicator
          Container(
            alignment: const Alignment(0, 0.75),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const WormEffect(
                dotWidth: 8,
                dotHeight: 16,
                activeDotColor: Colors.blue,
                dotColor: Colors.grey,
                spacing: 10,
              ),
            ),
          ),

          // page indicator
          Positioned(
            bottom: 20, // Adjust this value as needed
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: onLastPage
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: button(
                        text: "Get Started",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Body()));
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Skip button (conditionally rendered)
                          GestureDetector(
                            onTap: () {
                              _controller.jumpToPage(2);
                            },
                            child: const Text(
                              'skip',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          // Next button
                          GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOutCubic,
                              );
                            },
                            child: const Text(
                              'next',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
