import 'package:cuwea/components/current_condition.dart';
import 'package:cuwea/components/cuwea_logo.dart';
import 'package:cuwea/components/forecast_data_container.dart';
import 'package:cuwea/components/hourly_data_container.dart';
import 'package:cuwea/components/info_glance.dart';
import 'package:cuwea/components/search_bar.dart';
import 'package:cuwea/core/get_weather_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var weatherData = getSampleData();

  Future getWData(String value) async {
    // await Future.delayed(const Duration(seconds: 5));
    var data = await getWeatherData(value);
    setState(() {
      weatherData = data;
    });
  }

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
                  getWData(value);
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
                    InfoGlance(
                      temp: weatherData.currentData.temp,
                      feelsLike: weatherData.currentData.feelsLike,
                      city: weatherData.currentData.city,
                      dateTime: weatherData.currentData.date,
                      icon: weatherData.currentData.iconData,
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    // hourly data container
                    HourlyDataContainer(hourlyData: weatherData.hourData),

                    const SizedBox(
                      height: 15,
                    ),

                    // quotes
                    CurrentCondition(
                      conditionText: weatherData.conditionText,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    // forecast
                    ForecastDataContainer(
                        forecastData: weatherData.forecastData),

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
