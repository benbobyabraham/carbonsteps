import 'package:flutter/material.dart';
import 'package:nttgreen/screens/analytics/dashboardpage.dart';
// import 'package:nttgreen/screens/analytics/dashboardpage2.dart';
import 'package:nttgreen/screens/analytics/dashboardpage3.dart';
import 'package:toggle_switch/toggle_switch.dart';

// ignore: use_key_in_widget_constructors
class ToggleButton1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
        child: ToggleSwitch(
      minWidth: 183.0,
      cornerRadius: 20.0,
      activeBgColors: const [
        [Colors.white],
        [Colors.white]
      ],
      activeFgColor: Colors.black,
      inactiveBgColor: const Color.fromRGBO(231, 251, 244, 1),
      inactiveFgColor: Colors.black,
      initialLabelIndex: 0,
      totalSwitches: 2,
      labels: const ['Your Carbon Score', 'Compare Score'],
      radiusStyle: true,
      onToggle: (index) {
        // ignore: avoid_print
        print('Switched to: $index');
        if (index == 0) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const DashboardPage()));
        } else if (index == 1) {
          index = 1 + 1;
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const DashboardPage3()));
        }
      },
    ));
  }
}
