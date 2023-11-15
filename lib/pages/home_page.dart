import 'package:cuwea/components/current_condition.dart';
import 'package:cuwea/components/cuwea_logo.dart';
import 'package:cuwea/components/drawer_child.dart';
import 'package:cuwea/components/forecast_data_container.dart';
import 'package:cuwea/components/hourly_data_container.dart';
import 'package:cuwea/components/info_glance.dart';
import 'package:cuwea/components/search_bar.dart';
import 'package:cuwea/core/get_weather_data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> openGHSourcePage() async {
    await launchUrl(Uri.parse('https://github.com/Adwaith-Rajesh/CuWea'),
        mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 72, 110, 187),
            Color.fromARGB(255, 233, 129, 69),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          drawer: Drawer(
            child: DrawerChild(),
          ),
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
            actions: [
              GestureDetector(
                onTap: () {
                  openGHSourcePage();
                },
                child: Container(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: const Icon(
                      Icons.code_sharp,
                      size: 25,
                    )),
              ),
            ],
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
                    InfoGlance(currentData: weatherData.currentData),

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
