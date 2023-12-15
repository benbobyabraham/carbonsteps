import 'package:flutter/material.dart';
import 'package:nttgreen/screens/home/login_page.dart';
import 'package:nttgreen/screens/home/onboarding_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Color navColor = Color(0xFF056644);
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0), bottom: Radius.circular(0.20)),
      child: BottomAppBar(
        height: 70,
        color: navColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                //navigation code
              },
              icon: Icon(Icons.power_settings_new_outlined),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );

                //Home Button
              },
              child: Container(
                width: 98,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.green[900],
                        size: 24,
                      ),
                      Text(
                        " Home",
                        style: TextStyle(
                            color: Colors.green[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                //navigation code
              },
              icon: Image.asset("assets/images/setting.png"),
            ),
          ],
        ),
      ),
    );
  }
}
