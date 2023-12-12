import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 140),
          child: Lottie.asset(
            'animation/2.json',
            height: 400,
            repeat: true,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Bring nature home with our exquisite collection of plants.",
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
