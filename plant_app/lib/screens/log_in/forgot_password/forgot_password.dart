import 'package:flutter/material.dart';
import 'package:plant_app/screens/log_in/components/auth_page.dart';
import 'package:plant_app/screens/log_in/components/register_page.dart';
import 'package:plant_app/screens/log_in/forgot_password/components/body.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forgot Password",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
      ),
      body: Body(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AuthPage()));
        },
      ),
    );
  }
}
