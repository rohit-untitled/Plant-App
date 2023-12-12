import 'package:flutter/material.dart';
import 'package:plant_app/screens/log_in/Log_In_page.dart';
import 'package:plant_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  // LoginPage.routeName: (context) => LoginPage(),
};
