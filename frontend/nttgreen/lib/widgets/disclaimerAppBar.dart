import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisclaimerAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      toolbarHeight: 60,
      title: Text(
        "         Disclaimer",
        style: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      // centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.transparent, // Transparent color
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60); // Adjust the height as needed
}
