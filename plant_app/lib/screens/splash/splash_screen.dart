import 'package:flutter/material.dart';
import 'package:plant_app/screens/splash/components/body.dart';
import 'package:plant_app/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/spllash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
