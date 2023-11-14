import 'package:cuwea/models/current_data.dart';
import 'package:cuwea/models/forecast_data.dart';
import 'package:cuwea/models/hour_data.dart';
import 'package:cuwea/models/weather_data.dart';
import 'package:cuwea/core/env.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_icons/weather_icons.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

final List<HourData> sampleHourlyData = [
  HourData(
    hour: '11:00',
    temp: 30,
    precipitation: 2,
    iconData: WeatherIcons.cloud,
  ),
  HourData(
      hour: '12:00',
      temp: 31,
      precipitation: 1,
      iconData: WeatherIcons.day_sunny),
  HourData(
      hour: '13:00',
      temp: 33,
      precipitation: 0,
      iconData: WeatherIcons.day_sunny_overcast),
  HourData(
      hour: '13:00',
      temp: 33,
      precipitation: 3,
      iconData: WeatherIcons.day_sunny_overcast),
  HourData(
      hour: '14:00',
      temp: 34,
      precipitation: 0,
      iconData: WeatherIcons.day_sunny_overcast),
  HourData(
      hour: '15:00',
      temp: 32,
      precipitation: 10,
      iconData: WeatherIcons.rain_mix),
  HourData(
      hour: '16:00',
      temp: 36,
      precipitation: 12,
      iconData: WeatherIcons.night_rain_mix),
  HourData(
      hour: '17:00',
      temp: 36,
      precipitation: 0,
      iconData: WeatherIcons.day_sunny_overcast),
];

final List<ForecastData> sampleForecastData = [
  ForecastData(
      weekDay: 'Today',
      humidity: 23,
      precipitation: 1,
      maxTemp: 23,
      minTemp: 20),
  ForecastData(
      weekDay: 'Monday',
      humidity: 23,
      precipitation: 1,
      maxTemp: 23,
      minTemp: 20),
  ForecastData(
      weekDay: 'Tuesday',
      humidity: 23,
      precipitation: 1,
      maxTemp: 23,
      minTemp: 20),
];

var sampleCurrentData = CurrentData(
  temp: 30,
  feelsLike: 20,
  city: 'London',
  date: 'Tue',
  iconData: WeatherIcons.alien,
);

Future<WeatherData> getWeatherData(String location) async {
  var currentWeatherUri = Uri.https(
    'api.weatherapi.com',
    'v1/current.json',
    {
      'key': Env.weatherApiKey,
      'q': location,
      'days': '1',
      'aqi': 'no',
      'alerts': 'no',
    },
  );

  var forecastWeatherUri = Uri.https(
    'api.weatherapi.com',
    'v1/forecast.json',
    {
      'key': Env.weatherApiKey,
      'q': location,
      'days': '3',
      'aqi': 'no',
      'alerts': 'no',
    },
  );

  // current data
  var currentResponce = await http.get(currentWeatherUri);

  CurrentData currentData = sampleCurrentData;
  String conditionText = 'Hi';

  print(currentResponce.statusCode);
  if (currentResponce.statusCode == 200) {
    var currentJsonData = json.decode(currentResponce.body);
    var date = DateTime.now();
    currentData = CurrentData(
      temp: double.parse((currentJsonData['current']['temp_c']).toString())
          .round(),
      feelsLike:
          double.parse((currentJsonData['current']['feelslike_c']).toString())
              .round(),
      city: currentJsonData['location']['name'],
      date: DateFormat('EEE, HH:mm').format(date),
      iconData: WeatherIcons.day_sunny,
    );

    // conditionText =
    //     currentJsonData['forecast']['forecastday'][0]['condition']['text'];
  }

  // 3 day forecast and the hourly data for the day
  var forecastResponce = await http.get(forecastWeatherUri);
  print(forecastResponce.statusCode);

  return WeatherData(
      forecastData: sampleForecastData,
      hourData: sampleHourlyData,
      currentData: currentData,
      conditionText: conditionText);
}

WeatherData getSampleData() {
  return WeatherData(
      forecastData: sampleForecastData,
      hourData: sampleHourlyData,
      currentData: sampleCurrentData,
      conditionText: 'its sunny');
}
