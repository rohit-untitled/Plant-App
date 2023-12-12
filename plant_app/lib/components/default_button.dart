import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const button({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(36),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            // margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 58, 87, 25),
              borderRadius: BorderRadius.circular(36),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
