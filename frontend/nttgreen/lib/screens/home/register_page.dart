import 'package:flutter/material.dart';
// import 'package:nttgreen/components/button.dart';
import 'package:nttgreen/components/button copy.dart';
import 'package:nttgreen/screens/home/forgetpassword/otp_screen.dart';
import 'package:nttgreen/screens/home/login_page.dart';
import 'package:nttgreen/screens/home/onboarding_page.dart';
import 'package:nttgreen/screens/home/register_page.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/authentication_service.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  final dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 10),

                // logo
                ClipOval(
                  child: Image.asset(
                    'assets/images/o3.png',
                    width: 260,
                    height: 260,
                  ),
                ),

                const SizedBox(height: 100),

                // const SizedBox(height: 25),

                // username textfield

                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(55, 174, 230, 204),
                      border: Border.all(
                        color: Color.fromARGB(163, 178, 234, 211),
                      )),
                  width: 350,
                  height: 45,
                  // color: Color.fromARGB(30, 91, 210, 148),
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            // color: Color.fromARGB(255, 155, 219, 191),
                            width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      // filled: true,
                      // fillColor: Color.fromARGB(45, 221, 248, 229),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                //email textfield

                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(55, 174, 230, 204),
                      border: Border.all(
                        color: Color.fromARGB(163, 178, 234, 211),
                      )),
                  width: 350,
                  height: 45,
                  // color: Color.fromARGB(30, 91, 210, 148),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            // color: Color.fromARGB(255, 155, 219, 191),
                            width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      // filled: true,
                      // fillColor: Color.fromARGB(45, 221, 248, 229),
                    ),
                  ),
                ),

                const SizedBox(height: 25),
                // password textfield

                Container(
                  // decoration: BoxDecoration(),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(55, 174, 230, 204),
                      border: Border.all(
                        color: Color.fromARGB(162, 168, 235, 217),
                      )),
                  width: 350,
                  height: 45,
                  // color: Color.fromARGB(30, 91, 210, 148),
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(84, 174, 208, 186),
                            width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      // filled: true,
                      // fillColor: Color.fromARGB(255, 232, 239, 235),
                    ),
                  ),
                ),

                SizedBox(height: 25),

                //phone textfield

                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(55, 174, 230, 204),
                      border: Border.all(
                        color: Color.fromARGB(163, 178, 234, 211),
                      )),
                  width: 350,
                  height: 45,
                  // color: Color.fromARGB(30, 91, 210, 148),
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      hintText: "Phone Number",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            // color: Color.fromARGB(255, 155, 219, 191),
                            width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      // filled: true,
                      // fillColor: Color.fromARGB(45, 221, 248, 229),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                //Gender Textfield

                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(55, 174, 230, 204),
                      border: Border.all(
                        color: Color.fromARGB(163, 178, 234, 211),
                      )),
                  width: 350,
                  height: 45,
                  // color: Color.fromARGB(30, 91, 210, 148),
                  child: TextField(
                    controller: genderController,
                    decoration: const InputDecoration(
                      hintText: "Gender",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            // color: Color.fromARGB(255, 155, 219, 191),
                            width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      // filled: true,
                      // fillColor: Color.fromARGB(45, 221, 248, 229),
                    ),
                  ),
                ),

                SizedBox(height: 25),
                //Dob Textfield

                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(55, 174, 230, 204),
                      border: Border.all(
                        color: Color.fromARGB(163, 178, 234, 211),
                      )),
                  width: 350,
                  height: 45,
                  // color: Color.fromARGB(30, 91, 210, 148),
                  child: TextField(
                    controller: dobController,
                    decoration: const InputDecoration(
                      hintText: "Date of Birth",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            // color: Color.fromARGB(255, 155, 219, 191),
                            width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      // filled: true,
                      // fillColor: Color.fromARGB(45, 221, 248, 229),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // SignUP button

                Container(
                  width: 350, // Set the desired width
                  child: Button2(
                    onTap: () {
                      RegisterUser(context);
                    },
                    buttonText: 'Sign Up',
                  ),
                ),

                const SizedBox(height: 20),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      // Expanded(
                      //   child: Divider(
                      //     thickness: 0.5,
                      //     color: Colors.grey[400],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        // child: Text(
                        //   '',
                        //   style: TextStyle(
                        //     color: Color.fromARGB(255, 101, 100, 100),
                        //     fontSize: 16,
                        //     // fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ),
                      // Expanded(
                      //   child: Divider(
                      //     thickness: 0.5,
                      //     color: Colors.grey[400],
                      //   ),
                      // ),
                    ],
                  ),
                ),

                // const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account?",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 131, 131, 131)),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color.fromARGB(255, 6, 138, 92),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // sign user in method
  void RegisterUser(BuildContext context) async {
    final token = await registration(
        usernameController.text,
        emailController.text,
        passwordController.text,
        phoneController.text,
        genderController.text,
        dobController.text);
    await Future.delayed(Duration(seconds: 2));
    print(token);
    if (token != null) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('User Registered'),
          );
        },
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Please enter valid details'),
          );
        },
      );
    }
  }

  // void loginUser(BuildContext context) async {
  //   final token = await registration(
  //       usernameController.text,
  //       passwordController.text,
  //       emailController.text,
  //       phoneController.text,
  //       genderController.text,
  //       dobController.text);
  //   print(token);
  //   if (token != null) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => LoginPage()),
  //     );
  //   } else {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => LoginPage()),
  //     );
  //     // ignore: use_build_context_synchronously
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const AlertDialog(
  //           title: Text('Incorrect Credentials'),
  //         );
  //       },
  //     );
  //   }
  // }
}
