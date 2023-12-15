import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 5, 102, 68),
      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                bottom: 1.9,
                top: 52.0,
                right: 12), // Adjust the padding as needed
            child: Text(
              'Questionnaires',
              style: GoogleFonts.poppins(
                  fontSize: 28.0, fontWeight: FontWeight.w600),
            ),
          ),
          Align(
            alignment: Alignment.topRight,

            // Adjust the alignment as needed
            child: RichText(
              textAlign: TextAlign.end,
              text: TextSpan(
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 24, 151, 255),
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: "Powered by ",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'NTT DATA',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      elevation: 0.0,
      toolbarHeight: 140,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
      leading: Padding(
        padding: const EdgeInsets.only(
            left: 19.1, top: 27.0), // Adjust the padding as needed
        child: IconButton(
          iconSize: 32,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add your back button functionality here
            Navigator.of(context).pop();
          },
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
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
  Size get preferredSize =>
      const Size.fromHeight(110); // Adjust the height as needed
}
