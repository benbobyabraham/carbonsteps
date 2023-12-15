import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nttgreen/utils/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialBarCharts extends StatefulWidget {
  const RadialBarCharts({super.key});

  @override
  State<RadialBarCharts> createState() => _RadialBarChartsState();
}

class _RadialBarChartsState extends State<RadialBarCharts> {
  // late List<Data> _chartData;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _chartData = getChartData();
  //   super.initState();
  // }
  Color green1 = Color.fromRGBO(5, 172, 114, 1);
  Color green2 = Color.fromRGBO(10, 212, 139, 1);
  Color green3 = Color.fromARGB(255, 5, 102, 68);

  int t_no = (answers[6] == "Bus" || answers[6] == "Car") ? 50 : 60;
  int a_no = answers[4] == "Hotel" ? 30 : 40;
  int f_no = answers[5] == "Veg" ? 10 : 30;

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
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          RichText(
            text:
                TextSpan(style: DefaultTextStyle.of(context).style, children: [
              TextSpan(
                text: "Your Carbon footprint score is ",
                style: GoogleFonts.poppins(
                    fontSize: 16.5, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                  text: "${Constants.dashResponse}",
                  style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.green))
            ]),
          ),

          SfCircularChart(
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
                RadialBarSeries<Data, String>(
                    dataSource: chartData,
                    xValueMapper: (Data data, _) => data.Category,
                    yValueMapper: (Data data, _) => data.value,
                    pointColorMapper: (Data data, _) => data.color,
                    maximumValue: 100,
                    gap: '11%',
                    //  dataLabelSettings: DataLabelSettings(isVisible: true),
                    // radius: '70%',
                    trackOpacity: 0.2,
                    cornerStyle: CornerStyle.bothCurve),
              ]),
          //SizedBox(height: 20),
          CustomLegends(data: chartData),
        ],
      ),
    ));
  }

  // List<Data> getChartData() {
  //   final List<Data> chartData = [
  //     Data('CarbonFootprint', 85, Color.fromARGB(255, 4, 168, 9)),
  //     Data('Average', 80, Color.fromARGB(236, 7, 204, 14)),
  //     Data('WorldAverage', 70, Color.fromARGB(255, 6, 235, 14)),
  //   ];
  //   return chartData;
  // }
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
        Text(value + " kg"),
      ],
    );
  }
}
