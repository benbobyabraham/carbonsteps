import 'package:flutter/material.dart';
// import 'package:nttgreen/services/authentication_service.dart';
import 'package:nttgreen/utils/constants.dart';
import 'package:nttgreen/screens/home/onboarding_page.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 140,
      // ignore: avoid_unnecessary_containers
      title: Container(
        child: Row(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user.png'),
                  radius: 20.0,
                )),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               const Text(
                  'NTT Green',
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                ),
                Text(
                  'Hii ${Constants.userName} !',
                  style: TextStyle(
                      fontSize: 34.0, color: Color.fromARGB(255, 5, 102, 68)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70); // Adjust the height as needed
}
