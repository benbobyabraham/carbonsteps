import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 249, 250),
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 155, 171, 180),
        elevation: 10,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 183, 195, 201),
              child: Icon(
                Icons.person,
                size: 100,
                color: Color.fromARGB(255, 21, 5, 5),
              ),
              radius: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Keith Chasen',
              style: TextStyle(
                color: const Color.fromARGB(255, 13, 2, 2),
                letterSpacing: 1,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Level 8',
              style: TextStyle(
                color: Color.fromARGB(255, 5, 172, 114),
                letterSpacing: 1,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.blueGrey[800],
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      color: const Color.fromARGB(255, 5, 1, 1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'keith@mail.com',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Add functionality for an action button
              },
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 5, 172, 114),
                onPrimary: const Color.fromARGB(255, 255, 255, 255),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
