import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_app/screens/home/home_page.dart';
import 'package:plant_app/screens/log_in/components/login_or_register.dart';
import 'package:plant_app/screens/log_in/components/test_home_page.dart';
import 'package:plant_app/screens/log_in/Log_In_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user logged in
          if (snapshot.hasData) {
            return TestHomePage();
            // return HomePage();
          }
          //user not logged in
          else {
            return LoginRegister();
          }
        },
      ),
    );
  }
}
