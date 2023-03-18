import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Pie extends StatelessWidget {
  const Pie({required this.travel, required this.per, required this.house});
  final double travel;
  final double per;
  final double house;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          "ANALYSIS",
          style: TextStyle(
            fontSize: 28,
            fontFamily: "Poppins",
            color: Colors.green,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          height: 400,
          child: SfCircularChart(
            legend: Legend(isVisible: true),
            series: <CircularSeries>[
              PieSeries<ChartData, String>(
                dataLabelSettings: DataLabelSettings(
                    color: Colors.green[900],
                    labelPosition: ChartDataLabelPosition.outside,
                    angle: 0,
                    isVisible: true),
                dataSource: <ChartData>[
                  ChartData('Travel', travel, Colors.redAccent),
                  ChartData('Person', per, Colors.blueAccent),
                  ChartData('House', house, Colors.greenAccent),
                ],
                xValueMapper: (ChartData data, _) => data.category,
                yValueMapper: (ChartData data, _) => data.value,
                pointColorMapper: (ChartData data, _) => data.color,
                animationDuration: 1000,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green[600]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    'Total Emissions:${travel + per + house} metric tonnes',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    )));
  }
}

class ChartData {
  ChartData(this.category, this.value, this.color);
  final String category;
  final double value;
  final Color color;
}
