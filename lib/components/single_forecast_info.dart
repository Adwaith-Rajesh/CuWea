import 'package:cuwea/components/cw_text.dart';
import 'package:cuwea/models/forecast_data.dart';
import 'package:flutter/material.dart';

class SingleForecastWidget extends StatelessWidget {
  final ForecastData forecastData;

  const SingleForecastWidget({
    super.key,
    required this.forecastData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CWText(
                text: forecastData.weekDay,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              )
            ],
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.water_drop,
                  size: 12,
                  color: const Color(0xffF6F8FF).withOpacity(0.7),
                ),
                CWText(
                  text: '${forecastData.humidity.toString()}%',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.water_drop_rounded,
                  size: 12,
                  color: const Color(0xffF6F8FF).withOpacity(0.7),
                ),
                CWText(
                  text: forecastData.precipitation.toString(),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            CWText(
              text: '${forecastData.minTemp}°/${forecastData.maxTemp}°',
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ],
        )
      ],
    );
  }
}
