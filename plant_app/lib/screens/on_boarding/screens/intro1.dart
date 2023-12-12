import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green.shade200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 50),
            child: Lottie.asset(
              'animation/1.json',
              height: 490,
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
                "Discover the beauty of nature, one plant at a time.",
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
      ),
    );
  }
}
