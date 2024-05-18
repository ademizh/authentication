import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        padding: const EdgeInsets.all(25), // Padding added around the button
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8), // Border radius is circular with a radius of 8
        ),
        child: Center( // Changed to InkWell to provide visual feedback on tap
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16, // Font size specified as 16
              ),
            ),
          ),
        ),
    );
  }
}
