import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
class Chart extends StatefulWidget {
  const Chart({super.key});
  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: SfCartesianChart(
        title: ChartTitle(
            text: '            World Carbon Emission',
            alignment: ChartAlignment.near,
            textStyle: GoogleFonts.poppins(
                color: Color.fromARGB(255, 5, 102, 68),
                fontSize: 14,
                fontWeight: FontWeight.w500)),
        primaryXAxis: CategoryAxis(
          title: AxisTitle(text: 'Year'),
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 0),
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Carbon Emission (T)'),
          majorGridLines: MajorGridLines(
            width: 1,
            color: Colors.green,
          ),
          axisLine: AxisLine(width: 0),
          labelStyle: GoogleFonts.poppins(color: Colors.black),
        ),
        series: <SplineSeries<GraphData, double>>[
          SplineSeries<GraphData, double>(
              color: Color.fromARGB(255, 5, 102, 68),
              dataSource: <GraphData>[
                GraphData(4.79, 2015),
                GraphData(4.73, 2016),
                GraphData(4.75, 2017),
                GraphData(4.97, 2018),
                GraphData(4.78, 2019),
                GraphData(4.5, 2020),
                GraphData(4.69, 2021),
                GraphData(4.7, 2022),
              ],
              xValueMapper: (GraphData sales, _) => sales.year,
              yValueMapper: (GraphData sales, _) => sales.num,
              markerSettings: MarkerSettings(
                isVisible: true,
                color: Color.fromARGB(255, 5, 102, 68),
              ))
        ],
      ),
    );
  }
}

class GraphData {
  GraphData(this.num, this.year);
  final double year;
  final double num;
}
