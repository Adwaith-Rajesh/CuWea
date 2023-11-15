import 'package:cuwea/components/cw_text.dart';
import 'package:cuwea/models/current_data.dart';
import 'package:flutter/material.dart';

class InfoGlance extends StatelessWidget {
  final CurrentData currentData;

  const InfoGlance({
    super.key,
    required this.currentData,
  });

  String getShrinkCityName(BuildContext context, String cityName) {
    if (cityName.length < 15) return cityName;
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? cityName
        : cityName.replaceRange(15, currentData.city.length, '...');
  }

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
                  text: '${currentData.temp.toString()}°',
                  fontSize: 64,
                  fontWeight: FontWeight.w300,
                ),
                CWText(
                  text: getShrinkCityName(context, currentData.city),
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  width: 160,
                  height: 160,
                  child: Image.asset(
                    currentData.iconImagePath,
                    fit: BoxFit.fill,
                  ),
                ),
                // const SizedBox(
                //   width: 0,
                // ),
              ],
            ),
          ],
        ),

        const SizedBox(
          height: 25,
        ),

        // feels like and date
        CWText(
          text:
              '${currentData.temp.toString()}° / Feels like ${currentData.feelsLike.toString()}°',
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),

        CWText(
          text: currentData.date,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ],
    );
  }
}
