import 'package:flutter/material.dart';
import 'package:nttgreen/screens/analytics/DoughnutChart2.dart';
import 'package:nttgreen/screens/analytics/DoughnutChart1.dart';
import 'package:nttgreen/screens/analytics/DoughnutCharts.dart';
import 'package:nttgreen/screens/analytics/RadialBarChart1.dart';
import 'package:nttgreen/utils/constants.dart';
import 'package:nttgreen/widgets/analytics_appbar.dart';
import 'package:nttgreen/widgets/toogle_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:nttgreen/screens/analytics/chart.dart';
import 'package:nttgreen/widgets/app_bar1.dart';
import 'package:nttgreen/widgets/bottomnav1.dart';
import '../../widgets/analytics_ButtomNav.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    Color CustomWhite = Color(0xFFFFFFFF);

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 254, 253, 253),
      appBar: const HomeAppBar(),

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
                height: 528,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                  color: CustomWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, //Shadow Color
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
                  child:
                      answers[0] == "Yes" ? DoughnutChart() : DoughnutCharts(),
                  width: 192,
                  height: 192,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black),
                    color: CustomWhite,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //Chart
              Container(
                width: 382,
                height: 340,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                  color: CustomWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, //Shadow Color
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
                alignment: Alignment.center,
                child: Container(
                  width: 406,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/worldMap.png'),
                    fit: BoxFit.none,
                  )),
                  child: Chart(),
                ),
              ),
              SizedBox(height: 15),
            ]),
          ),
        ),
      ),

      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
