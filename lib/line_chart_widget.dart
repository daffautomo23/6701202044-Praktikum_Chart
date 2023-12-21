
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'sensor_tani.dart';

class LineChartWidget extends StatelessWidget {
  final List<HumidityPoint> soilHumPoints;
  final List<HumidityPoint> airHumPoints;

  const LineChartWidget({required this.soilHumPoints, required this.airHumPoints, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: soilHumPoints.map((point) => FlSpot(point.x, point.y)).toList(),
              isCurved: false,
              dotData: FlDotData(
                show: false,
              ),
            ),
            LineChartBarData(
              spots: airHumPoints.map((point) => FlSpot(point.x, point.y)).toList(),
              isCurved: false,
              dotData: FlDotData(
                show: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
