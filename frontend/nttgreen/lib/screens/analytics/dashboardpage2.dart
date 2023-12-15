// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nttgreen/screens/analytics/DoughnutChart2.dart';
import 'package:nttgreen/screens/analytics/DoughnutChart1.dart';
import 'package:nttgreen/screens/analytics/DoughnutCharts2.dart';
import 'package:nttgreen/screens/analytics/RadialBarChart1.dart';
import 'package:nttgreen/utils/constants.dart';
import 'package:nttgreen/widgets/analytics_ButtomNav.dart';
import 'package:nttgreen/widgets/analytics_appbar.dart';
import 'package:nttgreen/widgets/analytics_appbar2.dart';
import 'package:nttgreen/widgets/toogle_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:nttgreen/screens/analytics/chart.dart';
import 'package:nttgreen/widgets/app_bar1.dart';
// import 'package:nttgreen/widgets/app_bar2.dart';
import 'package:nttgreen/widgets/bottomnav1.dart';

class DashboardPage2 extends StatefulWidget {
  const DashboardPage2({Key? key}) : super(key: key);

  @override
  _DashboardPage2State createState() => _DashboardPage2State();
}

class _DashboardPage2State extends State<DashboardPage2> {
  @override
  Widget build(BuildContext context) {
    Color CustomWhite = Color(0xFFFFFFFF);

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 254, 253, 253),
      appBar: DashAppBar(),

      body: Container(
        decoration: BoxDecoration(color: CustomWhite),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              SizedBox(height: 10),
              Container(
                width: 383,
                height: 43,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                    )),

                child: ToggleButton1(), //ToggleButton
              ),
              SizedBox(height: 10),
              //RadialBar
              Container(
                width: 382,
                height: 410,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                  color: CustomWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white, //Shadow Color
                      blurRadius: 3.0, //Radius of shadow
                      offset: Offset(1, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 217, 222, 220),
                    width: 1.0,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: answers[0] == "Yes"
                      ? DoughnutChart2()
                      : DoughnutCharts2(),
                  width: 192,
                  height: 192,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black),
                    color: CustomWhite,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CustomRow()
            ]),
          ),
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  Color rowColor = Color.fromRGBO(231, 251, 244, 1);

  CustomRow({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRow(
            'Transportation',
            getTransportationValue(),
            'assets/images/Transportation.png',
            "${Constants.answers[0]}" == "No"
                ? "${Constants.answers[2]}"
                : "${Constants.answers[3]}",
            ' kg'),
        buildRow(
            'Accomodation',
            Constants.answers[5] == "Hotel" ? '1.5' : "0.5",
            'assets/images/Accomodation.png',
            "${Constants.answers[0]}" == "No"
                ? "${Constants.answers[4]}"
                : "${Constants.answers[5]}",
            ' kg'),
        buildRow(
            'Food',
            Constants.answers[6] == "Veg" ? '5.0' : "6.0",
            'assets/images/Food.png',
            "${Constants.answers[0]}" == "No"
                ? "${Constants.answers[5]}"
                : "${Constants.answers[6]}",
            ' kg'),
      ],
    );
  }

  String getTransportationValue() {
    // List<String> vals = Constants.answers;
    // double transport =  vals == "Veg" ? 5.0 : 6.0;
    // double accomo = 0.0;
    // double food = 0.0;
    Constants.transport =
        Constants.answers[3] == "Train" || Constants.answers[3] == "Flight"
            ? 7
            : 5;

    Constants.accomo = answers[5] == "Hotel" ? "2" : "3";
    Constants.food = Constants.answers[6] == "Veg" ? 1 : 2;
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
  // double transport = Constants.answers[3] == "Train"|| Constants.answers[3] == "Flight" ? 1.5 : 0.5;

  // double accomo = Constants.answers[5] == "Hotel" ? 1.5 : 0.5;
  // double food = Constants.answers[6] == "Veg" ? 5.0 : 6.0;

  Widget buildRow(
      String title, String weight, String image, String mode, String unit) {
    return Container(
      width: 378,
      height: 88,
      margin: EdgeInsets.all(8), // margin for spacing between rows
      decoration: BoxDecoration(
        color: rowColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 14), // spacing between the image and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 102, 68),
                  ),
                ),
                Text(
                  mode,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10), //  spacing between the text and number
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  weight,
                  style: GoogleFonts.poppins(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 76, 181, 118),
                  ),
                ),
                Text(
                  unit,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
