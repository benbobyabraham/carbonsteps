import 'package:flutter/material.dart';

class Button2 extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  const Button2({Key? key, this.onTap, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 37,

        padding: const EdgeInsets.symmetric(
            vertical: 10, horizontal: 5), // Smaller padding
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 5, 113, 75), // Medium dark green color
          borderRadius: BorderRadius.circular(6), // Curved edges
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16, // Slightly smaller font size
            ),
          ),
        ),
      ),
    );
  }
}
