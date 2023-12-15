import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nttgreen/screens/analytics/Disclaimer.dart';
import 'package:nttgreen/utils/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutCharts2 extends StatefulWidget {
  const DoughnutCharts2({super.key});

  @override
  State<DoughnutCharts2> createState() => _DoughnutCharts2State();
}

int t_no = (answers[6] == "Bus" || answers[6] == "Car") ? 50 : 60;
int a_no = answers[4] == "Hotel" ? 30 : 40;
int f_no = answers[5] == "Veg" ? 10 : 30;

class _DoughnutCharts2State extends State<DoughnutCharts2> {
  Color green1 = Color(0xFF05AC72);
  Color green2 = Color(0xFF0AD48B);
  Color green3 = Color(0xFF056644);

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
  Color customWhite = Color(0xFFFFFFFF);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 16),
            Stack(
              children: [
                Center(
                  child: SfCircularChart(
                    backgroundColor: customWhite,
                    annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                        widget: Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${Constants.dashResponse}",
                                  style: TextStyle(
                                    fontSize: 55,
                                    color: green1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Your Carbon',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.6,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'footprint score',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.6,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    legend: const Legend(
                      isVisible: false,
                      position: LegendPosition.bottom,
                      orientation: LegendItemOrientation.vertical,
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    series: <CircularSeries>[
                      DoughnutSeries<Data, String>(
                        dataSource: chartData,
                        xValueMapper: (Data data, _) => data.Category,
                        yValueMapper: (Data data, _) => data.value,
                        pointColorMapper: (Data data, _) => data.color,
                        innerRadius: '60%',
                      ),
                    ],
                  ),
                ),
                // Disclaimer hyperlink
                Positioned(
                  left: 5,
                  top: 250,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Disclaimer(),
                        ),
                      );
                    },
                    child: Text(
                      'Disclaimer!',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 99, 119, 134),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CustomLegends(data: chartData),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
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

// class KnowMoreButton extends StatelessWidget {
//   const KnowMoreButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 317,
//       height: 39,
//       child: TextButton(
//         onPressed: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => DashboardPage2()));
//         },
//         style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all<Color>(
//                 Color.fromARGB(255, 5, 102, 68))),
//         child: Text(
//           'know More',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
