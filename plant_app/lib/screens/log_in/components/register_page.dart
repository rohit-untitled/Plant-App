import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/components/default_button.dart';
import 'package:plant_app/screens/log_in/components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  //for register now button
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user in method
  Future<void> signUserUp() async {
    // show loading circle
    showDialog(
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  );

    // try creating an user
  //   try {
  //     // check if password is correct
  //     if (passwordController.text == confirmPasswordController.text) {
  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: emailController.text,
  //         password: passwordController.text,
  //       );
  //     } else {
  //       // show error message
  //       genericErrorMessage("Password don't match!");
  //     }

  //     //pop the loading circle
  //     Navigator.pop(context);
  //   } on FirebaseAuthException catch (e) {
  //     //pop the loading circle
  //     Navigator.pop(context);

  //     genericErrorMessage(e.code);
  //   }
  // }


   try {
    // check if the widget is still mounted before performing any actions
    if (mounted) {
      // check if password is correct
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // show error message
        genericErrorMessage("Password don't match!");
      }

      // check if the widget is still mounted before popping the dialog
      if (mounted) {
        Navigator.pop(context);
      }
    }
  } on FirebaseAuthException catch (e) {
    // check if the widget is still mounted before popping the dialog
    if (mounted) {
      Navigator.pop(context);
      genericErrorMessage(e.message ?? "An error occurred.");
    }
  }
}

  void genericErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                //welcome back

                const Text(
                  'Create an Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 25),

                //username
                MyTextField(
                  controller: emailController,
                  hintText: 'Username or email',
                  obscureText: false,
                ),

                const SizedBox(height: 15),
                //password
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 15),

                //sign in button
                button(
                  onTap: signUserUp,
                  text: 'Sign Up',
                ),
                const SizedBox(height: 20),

                const SizedBox(
                  height: 10,
                ),

                // continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          'OR',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),

                //google + apple button

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     //google buttom
                //     SquareTile(
                //       onTap: () => AuthService().signInWithGoogle(),
                //       imagePath: 'lib/icons/google.svg',
                //       height: 70,
                //     ),

                //     SizedBox(width: 20),
                //     // apple buttom
                //     SquareTile(
                //       onTap: () {},
                //       imagePath: 'lib/icons/Vector.svg',
                //       height: 70,
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 100,
                ),

                // not a memeber ? register now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ? ',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Login now',
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
          ),
        ),
      ),
    );
  }
}
