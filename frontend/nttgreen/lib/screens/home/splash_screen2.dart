import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nttgreen/screens/analytics/dashboardpage.dart';
import 'package:nttgreen/screens/home/splash_screen2.dart';
import 'package:nttgreen/widgets/app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import './widgets/questions.dart';
import 'package:nttgreen/components/button copy.dart';
import 'package:nttgreen/components/qbutton.dart';
import 'package:http/http.dart' as http;
// export 'package:http/http.dart' as http;
import 'dart:convert';
export 'dart:convert';
import 'package:nttgreen/utils/constants.dart';
import 'package:nttgreen/widgets/slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
export 'package:nttgreen/screens/quiz/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:nttgreen/screens/analytics/dashboardpage.dart';
import 'package:nttgreen/screens/home/login_page.dart';
import 'package:nttgreen/screens/home/login_initial.dart';
import 'package:nttgreen/utils/constants.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

Future<void> sendGetRequest2() async {
  print("Sending GET request Splash");
  final token =
      'f303fedbcfd972df9bf7ba62f5a03a89c49d8eba38653fc1c833416cf4d4'; // Replace with your token
  final baseUrl = 'http://10.138.50.145:8001/calculate?';
  // final queryParams = {
  //   'city': "Delhi",
  //   'modeoftravel': "Flight",
  //   'staytype': "Hotel",
  //   'days': "2",
  //   'food': "Veg",
  //   'localtravelmethod': "Walk",
  // };
  final queryParams = answers[0] == 'No'
      ? {
          'city': answers[1],
          'modeoftravel': answers[2],
          'staytype': answers[4],
          'days': answers[3],
          'food': answers[5],
          'localtravelmethod': answers[6],
        }
      : {
          'country': answers[1],
          'flightclass': answers[2],
          'staytype': answers[5],
          'days': answers[4],
          'food': answers[6],
          'localtravelmethod': answers[7],
        };
  final uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);
  print("Splash uri");

  print(uri.toString());

  try {
    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });

    // Constants.answers = [];
    // _selectedAnswers.forEach((questionIndex, answer) {
    //   final String question = questions[questionIndex]['question_text'];
    //   final String questionAnswerPair = '$answer';
    //   Constants.answers.add(questionAnswerPair);
    // });
    // print('GET request successful');
    print("Answers splash are: " + " ${Constants.answers}");
    print('Response: ${response.body}');
    // final dResponse = json.decode(response.body);
    // final footprint = dResponse['total_value'] * 100;
    // Constants.dashResponse = footprint.round().toString();
    // Constants.answers = [];
    // _selectedAnswers.forEach((questionIndex, answer) {
    //   final String question = questions[questionIndex]['question_text'];
    //   final String questionAnswerPair = '$answer';
    //   Constants.answers.add(questionAnswerPair);
    // });
    String getTransportationValue() {
      // List<String> vals = Constants.answers;
      // double transport =  vals == "Veg" ? 5.0 : 6.0;
      // double accomo = 0.0;
      // double food = 0.0;

      String transportationType = Constants.answers[3].toLowerCase();
      switch (transportationType) {
        case 'flight':
          return '2.5';

        case 'car':
          return '3.0';
        case 'bus':
          return '3.5';
        default:
          return '4.0';
      }
    }

    getTransportationValue();
    print(getTransportationValue());
    print(Constants.dashResponse);
    print("Answers are: " + " ${Constants.answers}");
    // print(footprint);

    // print('GET request failed with status code: ${response.statusCode}');
    print('');
  } catch (e) {
    print('Error sending GET request: $e');
  }
}

class _SplashScreenState extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay (e.g., 2 seconds) to display the splash screen.

    sendGetRequest2();

    Future.delayed(Duration(seconds: 7), () {
      // Navigate to the next screen (your main page).

      // print("ACCOMO IS: $accomo");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Display your splash screen image here.
        child: Padding(
          padding: EdgeInsets.only(bottom: 250),
          child: ClipOval(
            child: Image.asset(
              'assets/images/o3.png',
              width: 260,
              height: 260,
            ),
          ),
        ),
      ),
    );
  }
}
