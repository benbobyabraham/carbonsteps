import 'package:flutter/material.dart';

class DashAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      toolbarHeight: 60,
      title: Text(
        "Carbon Footprint",
        style: TextStyle(
            color: Colors.black, fontSize: 29, fontWeight: FontWeight.bold),
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
