import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:nttgreen/screens/analytics/dashboardpage.dart';
import 'package:nttgreen/screens/home/splash_screen2.dart';
import 'package:nttgreen/widgets/app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import './widgets/questions.dart';
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

class QuestionnaireDisplayPage extends StatefulWidget {
  final Map<String, dynamic> questionAndChoices;

  QuestionnaireDisplayPage({required this.questionAndChoices});

  @override
  _QuestionnaireDisplayPageState createState() =>
      _QuestionnaireDisplayPageState();
}

class _QuestionnaireDisplayPageState extends State<QuestionnaireDisplayPage> {
  Map<int, String> _selectedAnswers = {};

  int _selectedAnswersLength = 0;
  int _currentQuestionIndex = 0;
  List<Map<String, dynamic>> questions = [];
  int _displayedQuestionNumber = 1;
  String _currentQuestionLabel = '';

  final controller = PageController(); // PageController for page indicator

  @override
  void initState() {
    super.initState();
    questions = List.from(widget.questionAndChoices['results']);

    _updateCurrentQuestionLabel();
    _selectedAnswersLength = _selectedAnswers.length;
  }

  void _updateCurrentQuestionLabel() {
    final int totalQuestions = questions.length;
    _currentQuestionLabel = '$_displayedQuestionNumber of $totalQuestions';
  }

  Future<void> sendGetRequest() async {
    print("Sending GET request q");
    // final token =
    //     'f303fedbcfd972df9bf7ba62f5a03a89c49d8eba38653fc1c833416cf4d4'; // Replace with your token
    final baseUrl = 'http://10.138.50.145:8001/calculate?';

    final queryParams = _selectedAnswers[0] == "No"
        ? {
            'city': _selectedAnswers[1],
            'modeoftravel': _selectedAnswers[4],
            'staytype': _selectedAnswers[6],
            'days': _selectedAnswers[5],
            'food': _selectedAnswers[7],
            'localtravelmethod': _selectedAnswers[8],
          }
        : {
            'country': _selectedAnswers[1],
            'flightclass': _selectedAnswers[2],
            'staytype': _selectedAnswers[6],
            'days': _selectedAnswers[5],
            'food': _selectedAnswers[7],
            'localtravelmethod': _selectedAnswers[8],
          };
    // final queryParams = answers[0] == 'No'
    //   ? {
    //       'city': answers[1],
    //       'modeoftravel': answers[2],
    //       'staytype': answers[4],
    //       'days': answers[3],
    //       'food': answers[5],
    //       'localtravelmethod': answers[6],
    //     }
    //   : {
    //       'country': answers[1],
    //       'flightclass': answers[2],
    //       'staytype': answers[5],
    //       'days': answers[4],
    //       'food': answers[6],
    //       'localtravelmethod': answers[7],
    //     };

    final uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);
    print(uri.toString());
    Constants.answers = [];
    _selectedAnswers.forEach((questionIndex, answer) {
      final String question = questions[questionIndex]['question_text'];
      final String questionAnswerPair = '$answer';
      Constants.answers.add(questionAnswerPair);
    });
    try {
      final response = await http.get(uri, headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        Constants.answers = [];
        _selectedAnswers.forEach((questionIndex, answer) {
          final String question = questions[questionIndex]['question_text'];
          final String questionAnswerPair = '$answer';
          Constants.answers.add(questionAnswerPair);
        });
        print('GET request successful');
        print("Answers are: " + " ${Constants.answers}");
        print('Response: ${response.body}');

        final dResponse = json.decode(response.body);

        final footprint = dResponse['total_value'];

        Constants.dashResponse =
            double.parse(footprint.toString()).toStringAsFixed(2);

        String getTransportationValue() {
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
        print(footprint);
      } else {
        print('GET request failed with status code: ${response.statusCode}');
        print('');
      }
    } catch (e) {
      print('Error sending GET request: $e');
    }
  }

  Future<void> _submitAnswers() async {
    print("Submitting now");
    final token = Constants.authToken; // Replace with your token
    final url = 'http://10.138.50.145:8001/userresponses/';

    final List<String> responseList = [];

    _selectedAnswers.forEach((questionIndex, answer) {
      final String question = questions[questionIndex]['question_text'];
      final String questionAnswerPair = '$question : $answer';

      responseList.add(questionAnswerPair);
    });
    responseList.add(dashResponse);
    print(dashResponse);
    final responseString = responseList.join(', ');
    final Map<String, dynamic> requestBody = {
      'response': responseString,
      'user': 2,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        print('Answers submitted successfully');
        print('Response: ${response.body}');
      } else {
        print('Submitted: ${response.body}');
        print(responseString);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _goToPreviousQuestion(question) {
    setState(() {
      String currentquestion =
          questions[_currentQuestionIndex]['question_text'];
      if (_selectedAnswers.containsValue("Yes")) {
        final List<int> questionsToSkipBackward = [4];
        if (questionsToSkipBackward.contains(_currentQuestionIndex)) {
          _currentQuestionIndex -= 2;
          _selectedAnswersLength--;
          // _selectedAnswers[_currentQuestionIndex] = '';
        } else {
          _currentQuestionIndex--;
          _selectedAnswersLength--;
        }
        if (_currentQuestionIndex == 0) {
          _selectedAnswers.clear();
        }

        if (_currentQuestionIndex < 0) {
          _currentQuestionIndex = 0;
        }

        if (currentquestion == "Which class are you flying by?" &&
            _selectedAnswers.containsValue("First Class")) {
          print('current $currentquestion');
        }

        print(currentquestion);
        _displayedQuestionNumber--;
      }
      if (_selectedAnswers.containsValue("No")) {
        final List<int> questionsToSkipBackward = [3];
        if (questionsToSkipBackward.contains(_currentQuestionIndex)) {
          _currentQuestionIndex -= 3;
          _selectedAnswersLength--;
        } else {
          _currentQuestionIndex--;
          _selectedAnswersLength--;
          print(_selectedAnswersLength);
        }
        if (_currentQuestionIndex == 0) {
          _selectedAnswers.clear();
        }
        if (_currentQuestionIndex < 0) {
          _currentQuestionIndex = 0;
          _selectedAnswers.clear();
          _displayedQuestionNumber = 1;
        }

        _displayedQuestionNumber--;
      }
      controller.jumpToPage(_currentQuestionIndex);
      // controller.animateToPage(
      //   _currentQuestionIndex,
      //   duration: Duration(milliseconds: 01),
      //   curve: Curves.decelerate,
      // );
    });
  }

  void _goToNextQuestion(question) {
    setState(() {
      if (_currentQuestionIndex < questions.length - 1) {
        if (questions[_currentQuestionIndex]['question_text'] ==
            "Which class are you flying by?") {
          _currentQuestionIndex += 1;
        } else if (questions[_currentQuestionIndex]['question_text'] ==
                "Are you travelling from a different country?" &&
            _selectedAnswers.containsValue("No")) {
          _currentQuestionIndex += 2;
        }

        _currentQuestionIndex++;

        _displayedQuestionNumber++;
        _selectedAnswersLength++;

        controller.jumpToPage(_currentQuestionIndex);
      } else {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: SplashScreen2()));
        sendGetRequest();

        // _submitAnswers();

        print(_currentQuestionIndex);
      }
    });
  }

  void _selectAnswer(int questionIndex, String answer, String question) {
    setState(() {
      _selectedAnswers[questionIndex] = answer;
      if (questionIndex == 0) {
        _selectedAnswers.clear();
        if (_currentQuestionIndex == 0) {
          _selectedAnswers.clear();
        }
        _selectedAnswers[questionIndex] = answer;
      }
      String currentquestion =
          questions[_currentQuestionIndex]['question_text'];

      if (_currentQuestionIndex == 4 && _selectedAnswers.values.length == 3) {
        _currentQuestionIndex == 4;
      }

      if (_currentQuestionIndex == 2) {
        if (((answer == 'First Class') |
                (answer == 'Business Class') |
                (answer == 'Economy')) &&
            (question.contains("class"))) {
          if ((_currentQuestionIndex == 2)) {
            print(currentquestion);
          }
        }
      }

      if (_currentQuestionIndex >= questions.length) {
        _submitAnswers();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
      }
    });
  }

  Widget _getCurrentQuestionLabel() {
    final int currentQuestionNumber = _displayedQuestionNumber;
    int totalQuestions;
    final String currentQuestionLabel =
        currentQuestionNumber.toString().padLeft(2, '0');
    _selectedAnswers.values.contains("No")
        ? totalQuestions = questions.length - 2
        : totalQuestions = questions.length - 1;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: currentQuestionLabel,
            style: GoogleFonts.poppins(
              color: Colors.black87,
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: ' of 0$totalQuestions',
            style: GoogleFonts.poppins(
              color: Colors.black54,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> currentQuestionData = questions[_currentQuestionIndex];
    List<String> choices = List.from(
        currentQuestionData['choices'].map((choice) => choice['choice_text']));

    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BG.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 4.0, bottom: 20.0, left: 17, right: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Expanded(
                  child: PageView.builder(
                    controller: controller,
                    itemCount: questions.length,
                    pageSnapping: false,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final page = questions[index];
                      final rotationAngle =
                          ((_currentQuestionIndex - index).abs() * 0.1)
                              .clamp(0.0, 1.0);
                      final opacity = 1.0 - rotationAngle;
                      return Transform(
                        transform: Matrix4.identity()
                          ..scale(opacity, opacity)
                          ..rotateZ(rotationAngle),
                        child: QuestionPage(
                          currentQuestionLabel: _getCurrentQuestionLabel(),
                          questionIndex: index,
                          question: questions[index]['question_text'],
                          choices: List.from(questions[index]['choices']
                              .map((choice) => choice['choice_text'])),
                          selectedAnswer: _selectedAnswers[index],
                          onAnswerSelected: (String answer) {
                            _selectAnswer(index, answer,
                                questions[index]['question_text']);
                          },
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentQuestionIndex = index;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(19.0),
                        child: Button3(
                          onTap: _currentQuestionIndex > 0
                              ? () {
                                  print(_selectedAnswers.values.toList());
                                  print(_selectedAnswers.values.length);
                                  print(_selectedAnswersLength);
                                  print(
                                      "current question index  $_currentQuestionIndex");
                                  // _selectedAnswers[_displayedQuestionNumber - 1]);

                                  _goToPreviousQuestion(
                                      questions[_currentQuestionIndex]
                                          ['question_text']);
                                }
                              : null,
                          buttonText: 'Previous',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(19.0),
                        child: Button3(
                            onTap: () {
                              _goToNextQuestion(questions[_currentQuestionIndex]
                                  ['question_text']);

                              print(_selectedAnswers.values.toList());
                              print(_selectedAnswers.values.length);
                              print(_selectedAnswersLength);
                              print(
                                  "current question index  $_currentQuestionIndex");
                            },
                            buttonText:
                                _currentQuestionIndex < questions.length - 1
                                    ? 'Next'
                                    : 'Submit',
                            isEnabled: (_selectedAnswers.values.length >
                                _selectedAnswersLength)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),
                SmoothPageIndicator(
                  controller: controller,
                  count: questions.length,
                  effect: WormEffect(
                    dotHeight: 0.8,
                    dotWidth: 0.8,
                    dotColor: Color.fromARGB(255, 22, 131, 87),
                    activeDotColor: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
