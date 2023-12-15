import 'package:flutter/material.dart';

class Button3 extends StatelessWidget {
  final Function()? onTap;
  final bool isEnabled;
  final String buttonText;
  const Button3(
      {Key? key, this.onTap, required this.buttonText, this.isEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 8, horizontal: 1.5), // Smaller padding
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255), // Medium dark green color
          borderRadius: BorderRadius.circular(24), // Curved edges
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: Color.fromARGB(255, 4, 110, 73),
                // fontWeight: FontWeight.bold,
                fontSize: 17,
                fontWeight: FontWeight.w600 // Slightly smaller font size
                ),
          ),
        ),
      ),
    );
  }
}
