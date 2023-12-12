import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/log_in/Log_In_page.dart';
import 'package:plant_app/screens/log_in/components/auth_page.dart';
import 'package:plant_app/size_config.dart';

import '../../../components/default_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key});

  // signIn page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // Assets
              Image.asset("assets/splash/bonsai_logo.png"),
              SizedBox(
                height: 100,
              ),

              // Text
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Botaniq",
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Let's makes the world green again",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Get started button
              Align(
                alignment: Alignment.centerLeft,
                child: button(
                  text: "Get Started",
                  onTap: () {
                    // go to sign in page
                    // Navigator.pushNamed(context, '/LoginPage');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AuthPage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
