import 'package:flutter/material.dart';
import 'package:nttgreen/screens/analytics/dashboardpage.dart';
import 'package:nttgreen/widgets/app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:nttgreen/screens/quiz/questionnaire.dart';
import 'package:nttgreen/components/button copy.dart';
import 'package:nttgreen/components/qbutton.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nttgreen/utils/constants.dart';
import 'package:nttgreen/widgets/slider.dart';
import 'package:google_fonts/google_fonts.dart';

Map<String, Icon> choiceIcons = {
  'flight': Icon(
    Icons.airplanemode_active_outlined,
  ),
  'bus': Icon(Icons.directions_bus_sharp),
  'train': Icon(Icons.train_outlined),
  'car': Icon(Icons.directions_car),
  'rickshaw': Icon(Icons.electric_rickshaw_rounded),
  'bike': Icon(Icons.directions_bike),
  'walk': Icon(Icons.directions_walk_outlined)
};

class QuestionPage extends StatelessWidget {
  final int questionIndex;
  final String question;
  final List<String> choices;
  final String? selectedAnswer;
  final ValueChanged<String> onAnswerSelected;
  final Widget currentQuestionLabel;
  String? _currentSelectedAnswer;

  QuestionPage(
      {required this.questionIndex,
      required this.question,
      required this.selectedAnswer,
      required this.onAnswerSelected,
      required this.choices,
      required this.currentQuestionLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 9.0, bottom: 64.0, right: 12.0, left: 12.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 252, 250, 250),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 111, 156, 140).withOpacity(1),
            spreadRadius: 0.1,
            blurRadius: 0.1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: 13, top: 14.5),
              child: currentQuestionLabel),
          Container(
            padding: EdgeInsets.only(left: 13.5, bottom: 8.5),
            child: Text(
              'gerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr',
              style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 252, 250, 250),
                  fontSize: 1.5,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromARGB(255, 26, 120, 65),
                  decorationThickness: 42),
            ),
          ),
          SizedBox(height: 11.0),
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question,
                  style: GoogleFonts.poppins(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 20),
                if (questionIndex == 5) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Number of Days',
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 162, 162, 162),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Container(
                            width: 80,
                            height: 30,
                            padding: EdgeInsets.symmetric(
                              vertical: 4.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 250, 250),
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Color.fromARGB(255, 114, 233, 181),
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                selectedAnswer != null
                                    ? selectedAnswer!.split(',').first
                                    : '0',
                                style: GoogleFonts.poppins(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 14, 118, 71),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(right: 23.5, left: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '0',
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 4, 110, 73),
                          ),
                        ),
                        Text(
                          '10',
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 4, 110, 73),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 0.2),
                    padding: EdgeInsets.only(left: 0.2, right: 10),
                    child: CustomSlider(
                      value: selectedAnswer != null
                          ? double.parse(selectedAnswer!)
                          : 0,
                      onChanged: (double value) {
                        onAnswerSelected(value.toInt().toString());
                      },
                      min: 0,
                      max: 10,
                      divisions: 10,
                      trackHeight: 20.0,
                      // showTickMarks: true,
                    ),
                  )
                ] else if (choices.length > 5) ...[
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15, left: 0.9),
                        padding: EdgeInsets.only(right: 15, left: 10),
                        width: 320,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 251, 251, 251),
                          borderRadius: BorderRadius.circular(23.0),
                          border: Border.all(
                            color: Color.fromARGB(255, 129, 221, 164),
                          ),
                        ),
                        child: DropdownButton<String>(
                          underline:
                              Container(height: 0, color: Colors.transparent),
                          value: selectedAnswer,
                          isExpanded: true,
                          onChanged: (String? value) {
                            onAnswerSelected(value!);
                          },
                          items: [
                            DropdownMenuItem<String>(
                              value: null,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  question.contains("country")
                                      ? 'Search country'
                                      : "Search city",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    color: Color.fromARGB(255, 132, 130, 130),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            ...choices
                                .map<DropdownMenuItem<String>>((String choice) {
                              return DropdownMenuItem<String>(
                                value: choice,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Text(
                                    choice,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.9,
                                      color: Color.fromARGB(255, 110, 108, 108),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ],
                          style: GoogleFonts.poppins(
                            fontSize: 17.9,
                            color: Colors.black,
                          ),
                          dropdownColor: Color.fromARGB(255, 255, 255, 255),
                          elevation: 0,
                        ),
                      ),
                      SizedBox(height: 60),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/images/world1.png',
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ] else ...[
                  Column(
                    children: choices.map<Widget>((String choice) {
                      bool isSelected = selectedAnswer == choice;

                      Icon? icon;
                      choiceIcons.forEach((keyword, choiceIcon) {
                        if (choice.toLowerCase() == keyword) {
                          icon = choiceIcon;
                        }
                        if (choice.toLowerCase() == keyword && isSelected) {
                          icon = Icon(icon?.icon,
                              color: Color.fromARGB(255, 12, 137, 94));
                        } else if (choice.toLowerCase() == keyword &&
                            !isSelected) {
                          icon = Icon(icon?.icon,
                              color: Color.fromARGB(255, 125, 123, 123));
                        }
                      });

                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 2, right: 14, top: 6, bottom: 6),
                        child: InkWell(
                          onTap: () {
                            _currentSelectedAnswer = choice;
                            onAnswerSelected(choice);
                          },
                          child: Container(
                            padding: EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Color.fromARGB(255, 206, 241, 227)
                                  : Color.fromARGB(255, 246, 245, 245),
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(
                                color: isSelected
                                    ? Color.fromARGB(255, 188, 239, 218)
                                    : Color.fromARGB(255, 246, 245, 245),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (icon != null)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: icon!,
                                  ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    choice,
                                    style: GoogleFonts.poppins(
                                      fontSize: 15.9,
                                      fontWeight: FontWeight.w500,
                                      color: isSelected
                                          ? Color.fromARGB(255, 4, 110, 73)
                                          : Color.fromARGB(255, 111, 109, 109),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}






      // if (_currentSelectedAnswer == null &&
                      //     question.contains("staying")) {
                      //   // isSelected = true;
                      //   _currentSelectedAnswer = "Hotel";
                      //   isSelected = true;
                      //   print(
                      //       '_currentSelectedAnswer is $_currentSelectedAnswer');
                      // } else if (question.contains("staying")) {
                      //   _currentSelectedAnswer = 'f';
                      // } else if (question.contains("staying") &&
                      //     selectedAnswer == "Non-Hotel") {
                      //   isSelected = false;
                      //   _currentSelectedAnswer = "Non-Hotel";
                      //   isSelected = true;
                      //   print('selectedAnswer is $selectedAnswer');
                      //   print('choice is $choice');
                      //   print(
                      //       '_currentSelectedAnswer is $_currentSelectedAnswer');
                      // }