import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/details_screen.dart';
import 'package:plant_app/screens/sidebar/body.dart';
import 'package:plant_app/screens/home/home_page.dart';
import 'package:plant_app/screens/log_in/components/auth_page.dart';
import 'package:plant_app/screens/log_in/Log_In_page.dart';
import 'package:plant_app/screens/on_boarding/onboarding_screen.dart';
import './screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // fontFamily: "",
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          // textTheme: TextTheme(
          //   headline6: TextStyle(
          //     color: Color(0XFF8B8B8B),
          //     fontSize: 18,
          //   ),
          // ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: kTextColor),
          bodyMedium: TextStyle(color: kTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomePage(),
      // home: SplashScreen(),
      home: OnBoarding(),
      // home: AuthPage(),
      // home: Body(),
      // initialRoute: SplashScreen.routeName,
      // routes: routes,
      // home: LoginPage(),
      // routes: {
      //   // '/LoginPage': (context) => const LoginPage(),
      //   '/AuthPage': (context) => const AuthPage(),
      // },
    );
  }
}
