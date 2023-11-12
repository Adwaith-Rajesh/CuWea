import 'package:cuwea/components/current_condition.dart';
import 'package:cuwea/components/cuwea_logo.dart';
import 'package:cuwea/components/forecast_data_container.dart';
import 'package:cuwea/components/hourly_data_container.dart';
import 'package:cuwea/components/info_glance.dart';
import 'package:cuwea/components/search_bar.dart';
import 'package:cuwea/models/forecast_data.dart';
import 'package:cuwea/models/hour_data.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _submitText = 'Hello';
  final List<HourData> _hourlyData = [
    HourData(
        hour: '11:00',
        temp: 30,
        precipitation: 2,
        iconData: WeatherIcons.cloud),
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

  final List<ForecastData> forecastData = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 76, 110, 179),
            Color.fromARGB(255, 144, 172, 238),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: CitySearchBox(
              onSubmitted: (value) {
                setState(() {
                  _submitText = value;
                });
              },
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // info at a glance
                    const InfoGlance(
                      temp: 30,
                      feelsLike: 22,
                      city: 'Kakkad',
                      dateTime: 'Sun, 11:07',
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    // hourly data container
                    HourlyDataContainer(hourlyData: _hourlyData),

                    const SizedBox(
                      height: 15,
                    ),

                    // quotes
                    const CurrentCondition(
                      conditionText: 'It\'s Sunny Today. Go out and enjoy.',
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    // forecast
                    ForecastDataContainer(forecastData: forecastData),

                    const SizedBox(
                      height: 15,
                    ),

                    Divider(
                      color: Colors.grey[400],
                    ),

                    const CuWeaLogo(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
