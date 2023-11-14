import 'package:flutter/material.dart';

class CurrentData {
  int temp;
  int feelsLike;
  String city;
  String date;
  IconData iconData;

  CurrentData({
    required this.temp,
    required this.feelsLike,
    required this.city,
    required this.date,
    required this.iconData,
  });
}
