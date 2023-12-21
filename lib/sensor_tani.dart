import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class HumidityPoint {
  final double x;
  final double y;

  HumidityPoint({required this.x, required this.y});
}

Future<Map<String, List<HumidityPoint>>> getPoints(BuildContext context) async {
  List<HumidityPoint> soilHumPoints = [];
  List<HumidityPoint> airHumPoints = [];

  final data = await rootBundle.loadString('assets/data_sensor.json');
  final List<dynamic> jsonData = jsonDecode(data);

  for (var row in jsonData) {
    soilHumPoints.add(HumidityPoint(
      x: soilHumPoints.length.toDouble(),
      y: double.parse(row['soil_hum'].toString()),
    ));

    airHumPoints.add(HumidityPoint(
      x: airHumPoints.length.toDouble(),
      y: double.parse(row['hum'].toString()),
    ));
  }

  return {
    'soilHum': soilHumPoints,
    'airHum': airHumPoints,
  };
}




