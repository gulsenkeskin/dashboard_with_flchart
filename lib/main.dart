import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: LayoutBuilder(builder: (context, constraints) {
        return GridView.count(
          crossAxisCount: constraints.maxWidth < 800 ? 1 : 2,
          childAspectRatio: 1.7,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: const [
            Card(
              child: Chart1(),
            ),
            Card(),
            Card(),
            Card(),
          ],
        );
      }),
    );
  }
}

class Chart1 extends StatelessWidget {
  const Chart1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18, top: 18, bottom: 18),
      child: BarChart(
        BarChartData(
            barGroups: [
              BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 20)]),
              BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 40)]),
              BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 30)]),
              BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 60)]),
              BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 75)]),
              BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 35)]),
              BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 42)]),
              BarChartGroupData(x: 7, barRods: [BarChartRodData(toY: 33)]),
              BarChartGroupData(x: 8, barRods: [BarChartRodData(toY: 60)]),
              BarChartGroupData(x: 9, barRods: [BarChartRodData(toY: 90)]),
              BarChartGroupData(x: 10, barRods: [BarChartRodData(toY: 86)]),
              BarChartGroupData(x: 11, barRods: [BarChartRodData(toY: 120)]),
            ],
            titlesData: FlTitlesData(
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            )),
      ),
    );
  }
}
