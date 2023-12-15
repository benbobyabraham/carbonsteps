import 'package:flutter/material.dart';
import 'package:nttgreen/components/qbutton.dart';
import 'package:nttgreen/screens/analytics/dashboardpage.dart';
import 'package:nttgreen/screens/home/profile.dart';
import 'package:nttgreen/utils/constants.dart';
import 'package:nttgreen/widgets/app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nttgreen/screens/quiz/questionnaire.dart';
import 'package:nttgreen/components/button copy.dart';
import 'package:nttgreen/widgets/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:nttgreen/widgets/app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nttgreen/screens/quiz/questionnaire.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:page_transition/page_transition.dart';

// Future<void> sendGetRequest() async {
//   print("Sending GET request");
//   final token =
//       'f303fedbcfd972df9bf7ba62f5a03a89c49d8eba38653fc1c833416cf4d4'; // Replace with your token
//   final baseUrl = 'http://10.138.50.145:8001/calculate?';
//   final queryParams = {
//     'city': "Delhi",
//     'modeoftravel': "Flight",
//     'staytype': "Hotel",
//     'days': "2",
//     'food': "Veg",
//     'localtravelmethod': "Walk",
//   };
//   // final queryParams = {
//   //   'city': _selectedAnswers[1],
//   //   'modeoftravel': _selectedAnswers[4],
//   //   'staytype': _selectedAnswers[6],
//   //   'days': _selectedAnswers[5],
//   //   'food': _selectedAnswers[7],
//   //   'localtravelmethod': _selectedAnswers[8],
//   // };
//   final uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);
//   print(uri.toString());
//   try {
//     final response = await http.get(uri, headers: {
//       'Authorization': 'Bearer $token',
//       'Content-Type': 'application/json',
//     });
//     if (response.statusCode == 200) {
//       print('GET request successful');
//       print('Response: ${response.body}');
//       final dResponse = json.decode(response.body);
//       final footprint = dResponse['total_value'] * 1000;
//       Constants.dashResponse = footprint.toString();
//       print(Constants.dashResponse);
//       print(footprint);
//     } else {
//       print('GET request failed with status code: ${response.statusCode}');
//       print('');
//     }
//   } catch (e) {
//     print('Error sending GET request: $e');
//   }
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: Color.fromARGB(255, 5, 102, 68),
      body: Container(
        margin: EdgeInsets.only(left: 20, bottom: 5),
        padding: EdgeInsets.only(bottom: 20, left: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Home.jpg'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Padding(
            // padding: const EdgeInsets.all(15.0),
            // child: ClipOval(
            //   child: Image.asset(
            //     'assets/images/o2.png',
            //     width: 180,
            //     height: 180,
            //   ),
            // ),
            // ),
            SizedBox(
              height: 30,
              width: 290,
              child: Divider(
                height: 60,
                color: Colors.green[800],
              ),
            ),
            SizedBox(
              height: 30,
              width: 290,
              child: RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 94, 183, 255),
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: " ",
                      style: TextStyle(
                          fontSize: 1.4,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: '',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80),
            Container(
              padding: EdgeInsets.only(right: 15),
              color: Colors.transparent,
              child: Column(
                children: [
                  Text(
                    'Reduce Today, Breathe Tomorrow.',
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: Image.asset(
                      'assets/images/gif2.gif',
                      width: 400,
                      height: 300,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: ElevatedButton(
                      onPressed: () async {
                        final questionAndChoices =
                            await fetchQuestionAndChoices(Constants.authToken);
                        if (questionAndChoices != null)
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              // duration: Duration(milliseconds: 50),
                              child: QuestionnaireDisplayPage(
                                  questionAndChoices: questionAndChoices),
                            ),
                          );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 27, 114, 83),
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Launch Questions"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   unselectedItemColor: const Color.fromARGB(255, 5, 172, 114),
      //   selectedFontSize: 14,
      //   unselectedFontSize: 12,
      //   selectedItemColor: Color.fromARGB(255, 5, 172, 114),
      //   backgroundColor: Color.fromARGB(255, 255, 255, 255),
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         backgroundColor: Color.fromARGB(255, 43, 102, 77),
      //         icon: Icon(Icons.dashboard),
      //         label: 'Dash'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.question_answer), label: 'Quiz'),
      //   ],
      //   onTap: (index) async {
      //     if (index == 2) {
      //       final questionAndChoices =
      //           await fetchQuestionAndChoices(Constants.authToken);
      //       if (questionAndChoices != null)
      //         Navigator.push(
      //           context,
      //           PageTransition(
      //             type: PageTransitionType.fade,
      //             // duration: Duration(milliseconds: 50),
      //             child: QuestionnaireDisplayPage(
      //                 questionAndChoices: questionAndChoices),
      //           ),
      //         );
      //     } else if (index == 1) {
      //       sendGetRequest();
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => const DashboardPage(),
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }
}

Future<Map<String, dynamic>> fetchQuestionAndChoices(String token) async {
  final url = 'http://10.138.50.145:8001/questions/';
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch questions');
  }
}
