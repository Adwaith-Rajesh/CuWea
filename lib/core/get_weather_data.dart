import 'package:cuwea/core/weather_code.dart';
import 'package:cuwea/models/current_data.dart';
import 'package:cuwea/models/forecast_data.dart';
import 'package:cuwea/models/hour_data.dart';
import 'package:cuwea/models/weather_data.dart';
import 'package:cuwea/core/env.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

final List<HourData> sampleHourlyData = [
  HourData(
    hour: '11:00',
    temp: 30,
    precipitation: 2,
    iconImagePath: getIconImagePath('1000', 2),
  ),
  HourData(
    hour: '12:00',
    temp: 31,
    precipitation: 1,
    iconImagePath: getIconImagePath('1000', 2),
  ),
  HourData(
    hour: '13:00',
    temp: 33,
    precipitation: 0,
    iconImagePath: getIconImagePath('1000', 2),
  ),
  HourData(
    hour: '13:00',
    temp: 33,
    precipitation: 3,
    iconImagePath: getIconImagePath('1000', 2),
  ),
  HourData(
    hour: '14:00',
    temp: 34,
    precipitation: 0,
    iconImagePath: getIconImagePath('1000', 2),
  ),
  HourData(
    hour: '15:00',
    temp: 32,
    precipitation: 10,
    iconImagePath: getIconImagePath('1000', 2),
  ),
  HourData(
    hour: '16:00',
    temp: 36,
    precipitation: 12,
    iconImagePath: getIconImagePath('1000', 2),
  ),
  HourData(
    hour: '17:00',
    temp: 36,
    precipitation: 0,
    iconImagePath: getIconImagePath('1000', 2),
  ),
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
  city: 'Mars',
  date: 'tue, 24:59',
  iconImagePath: getIconImagePath('1000', 4),
);

int _doubleToInt(String dAsStr) {
  return double.parse(dAsStr).round();
}

Future<WeatherData> getWeatherData(String location) async {
  var currentWeatherUri = Uri.http(
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

  var forecastWeatherUri = Uri.http(
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
  List<HourData> hourData = sampleHourlyData;
  List<ForecastData> forecastData = sampleForecastData;
  String conditionText = 'Hi';

  if (currentResponce.statusCode == 200) {
    var currentJsonData = json.decode(currentResponce.body);
    currentData = CurrentData(
      temp: double.parse((currentJsonData['current']['temp_c']).toString())
          .round(),
      feelsLike:
          double.parse((currentJsonData['current']['feelslike_c']).toString())
              .round(),
      city: currentJsonData['location']['name'],
      date: DateFormat('EEE, HH:mm').format(DateFormat('yyyy-MM-dd hh:mm')
          .parse(currentJsonData['location']['localtime'])),
      iconImagePath: getIconImagePath(
          (currentJsonData['current']['condition']['code']).toString(), 4),
    );

    conditionText = currentJsonData['current']['condition']['text'];
  }

  // 3 day forecast and the hourly data for the day
  var forecastResponse = await http.get(forecastWeatherUri);

  if (forecastResponse.statusCode == 200) {
    hourData.clear();
    forecastData.clear();

    var forecastJsonData =
        json.decode(forecastResponse.body) as Map<String, dynamic>;
    var todayHourData = forecastJsonData['forecast']['forecastday'][0]['hour'];
    var threeDayForecast = forecastJsonData['forecast']['forecastday'];

    for (int i = 0; i < 24; i++) {
      hourData.add(
        HourData(
          hour: (todayHourData[i]['time'].toString()).split(' ')[1],
          temp: double.parse(todayHourData[i]['temp_c'].toString()).round(),
          precipitation:
              double.parse(todayHourData[i]['precip_mm'].toString()).round(),
          iconImagePath: getIconImagePath(
              (todayHourData[i]['condition']['code']).toString(), 2),
        ),
      );
    }

    for (int i = 0; i < 3; i++) {
      forecastData.add(ForecastData(
        weekDay: DateFormat('EEEE').format(
            DateFormat('yyyy-MM-dd').parse(threeDayForecast[i]['date'])),
        humidity: _doubleToInt(
          threeDayForecast[i]['day']['avghumidity'].toString(),
        ),
        precipitation: _doubleToInt(
            threeDayForecast[i]['day']['totalprecip_mm'].toString()),
        maxTemp:
            _doubleToInt(threeDayForecast[i]['day']['maxtemp_c'].toString()),
        minTemp:
            _doubleToInt(threeDayForecast[i]['day']['mintemp_c'].toString()),
      ));
    }
  }

  return WeatherData(
      forecastData: forecastData,
      hourData: hourData,
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
