import 'package:cuwea/models/current_data.dart';
import 'package:cuwea/models/forecast_data.dart';
import 'package:cuwea/models/hour_data.dart';

class WeatherData {
  List<ForecastData> forecastData;
  List<HourData> hourData;
  CurrentData currentData;
  String conditionText;

  WeatherData({
    required this.forecastData,
    required this.hourData,
    required this.currentData,
    required this.conditionText,
  });
}
