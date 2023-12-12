import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_app/components/default_button.dart';
import 'package:plant_app/screens/log_in/components/my_text_field.dart';

class Body extends StatefulWidget {
  final Function()? onTap;
  const Body({Key? key, required this.onTap});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emailController = TextEditingController();

  void _sendPasswordResetEmail() async {
    try {
      // Check if the widget is still mounted before performing any actions
      if (mounted) {
        // Show a loading indicator or perform any other UI updates here
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim(),
        );
        // Password reset email sent successfully
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      // Check if the widget is still mounted before popping the dialog
      if (mounted) {
        Navigator.pop(context);
        _showErrorMessage(e.message ?? "An error occurred.");
      }
    }
  }

  void _showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            "Forgot Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(height: 10),
          const Text(
            "Please enter your email\n to get the OTP and reset the password",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: emailController,
            hintText: 'Enter your email',
            obscureText: false,
          ),
          const SizedBox(height: 35),
          button(text: "Reset Password", onTap: _sendPasswordResetEmail),
          const SizedBox(height: 50),

          //dont have and account sign up
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account ? ',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              GestureDetector(
                // onTap: () {},
                onTap: widget.onTap,
                child: Text(
                  ' now',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
