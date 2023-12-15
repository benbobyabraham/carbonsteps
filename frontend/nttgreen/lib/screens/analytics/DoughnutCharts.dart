import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nttgreen/screens/analytics/RadialBarChart1.dart';
import 'package:nttgreen/screens/analytics/RadialBarChart1.dart';
import 'package:nttgreen/screens/analytics/dashboardpage2.dart';
import 'package:nttgreen/utils/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:nttgreen/screens/quiz/questionnaire.dart';

class DoughnutCharts extends StatefulWidget {
  const DoughnutCharts({super.key});

  @override
  State<DoughnutCharts> createState() => _DoughnutChartsState();
}

class _DoughnutChartsState extends State<DoughnutCharts> {
  Color green1 = Color(0xFF05AC72);
  Color green2 = Color(0xFF0AD48B);
  Color green3 = Color(0xFF056644);
  String getTransportationValuee() {
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

  int t_no = (answers[6] == "Bus" || answers[6] == "Car") ? 50 : 60;
  int a_no = answers[4] == "Hotel" ? 30 : 40;
  int f_no = answers[5] == "Veg" ? 10 : 30;
  Color CustomWhite = Color(0xFFFFFFFF);
  @override
  Widget build(BuildContext context) {
    final List<Data> chartData = [
      Data(
          'Transportation',
          // ((transport / (accomo + transport + food)) * 100).round()

          ((t_no / (t_no + a_no + f_no)) * 100).round(),
          Color.fromARGB(255, 5, 102, 68)),
      Data('Accomodation', ((a_no / (t_no + a_no + f_no)) * 100).round(),
          Color.fromRGBO(5, 172, 114, 1)),
      Data('Fooding', ((f_no / (t_no + a_no + f_no)) * 100).round(),
          Color.fromRGBO(10, 212, 139, 1)),
    ];
    // var dashResponse;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(height: 16),
          RichText(
            text:
                TextSpan(style: DefaultTextStyle.of(context).style, children: [
              TextSpan(
                text: "Your Carbon footprint score is ",
                style: GoogleFonts.poppins(
                    fontSize: 16.5, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                  text: '${Constants.dashResponse}',
                  style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.green))
            ]),
          ),
          SfCircularChart(
              backgroundColor: CustomWhite,
              //image setting in chart
              annotations: <CircularChartAnnotation>[
                CircularChartAnnotation(
                    widget: Container(
                  width: 50,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/tree.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
              ],
              legend: const Legend(
                  isVisible: false,

                  // offset: Offset(-70, 0),
                  position: LegendPosition.bottom,
                  orientation: LegendItemOrientation.vertical,
                  textStyle: TextStyle(fontSize: 14)),
              series: <CircularSeries>[
                DoughnutSeries<Data, String>(
                  dataSource: chartData,
                  xValueMapper: (Data data, _) => data.Category,
                  yValueMapper: (Data data, _) => data.value,
                  pointColorMapper: (Data data, _) => data.color,
                  innerRadius: '60%',

                  // cornerStyle: CornerStyle.bothCurve
                ),
              ]),
          //SizedBox(height: 20),
          CustomLegends(data: chartData),
          SizedBox(height: 20),
          KnowMoreButton(),
        ],
      ),
    ));
  }
}

class Data {
  Data(this.Category, this.value, this.color);
  final String Category;
  final int value;
  final Color color;
}

class CustomLegends extends StatelessWidget {
  final List<Data> data;
  CustomLegends({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: data.map((chartdata) {
        return Column(
          children: [_buildLegendItems(chartdata), SizedBox(height: 8)],
        );
      }).toList(),
    );
  }

  Widget _buildLegendItems(Data chartData) {
    String value = chartData.value.toString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 15,
              height: 15,
              color: chartData.color,
            ),
            SizedBox(
              width: 15,
            ),
            Text(chartData.Category),
          ],
        ),
        Text(value + " %"),
      ],
    );
  }
}

class KnowMoreButton extends StatelessWidget {
  const KnowMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 317,
      height: 39,
      child: TextButton(
        onPressed: () {
          print("");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashboardPage2()));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 5, 102, 68))),
        child: Text(
          'Know More',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
    );
  }
}
