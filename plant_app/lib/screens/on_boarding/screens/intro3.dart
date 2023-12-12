import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro3 extends StatelessWidget {
  const Intro3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 140),
          child: Lottie.asset(
            'animation/wel.json',
            // height: 400,
            repeat: false,
            fit: BoxFit.cover,
          ),
        ),
        Image.asset(
          'assets/splash/bonsai_logo.png',
          width: 325,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Each plant tells a story, and we're here to help you create your own green sanctuary. Start your journey with us.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        )
      ],
    );
  }
}
