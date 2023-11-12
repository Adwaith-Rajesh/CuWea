import 'package:cuwea/components/cw_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class InfoGlance extends StatelessWidget {
  final int temp;
  final int feelsLike;
  final String city;
  final String dateTime;

  const InfoGlance({
    super.key,
    required this.temp,
    required this.feelsLike,
    required this.city,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // temperature , place and weather icon
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // temperature and place
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CWText(
                  text: '${temp.toString()}°',
                  fontSize: 64,
                  fontWeight: FontWeight.w300,
                ),
                CWText(
                  text: city,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),

            const Row(
              children: [
                Icon(
                  WeatherIcons.day_sunny,
                  size: 128,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),

        const SizedBox(
          height: 25,
        ),

        // feels like and date
        CWText(
          text: '${temp.toString()}° / Feels like ${feelsLike.toString()}°',
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),

        CWText(
          text: dateTime,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ],
    );
  }
}
