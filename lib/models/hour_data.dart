import 'package:flutter/material.dart';

class HourData {
  String hour;
  int temp;
  int precipitation;
  IconData iconData;

  HourData({
    required this.hour,
    required this.temp,
    required this.precipitation,
    required this.iconData,
  });
}
