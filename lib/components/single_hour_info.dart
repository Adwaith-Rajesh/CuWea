import 'package:cuwea/components/cw_text.dart';
import 'package:cuwea/models/hour_data.dart';
import 'package:flutter/material.dart';

class SingleHourDataWidget extends StatelessWidget {
  final HourData hourData;

  const SingleHourDataWidget({
    super.key,
    required this.hourData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CWText(
            text: hourData.hour,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          Icon(
            hourData.iconData,
            color: Color.fromARGB(255, 51, 90, 233).withOpacity(0.7),
          ),
          CWText(
            text: '${hourData.temp.toString()}°',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          Row(
            children: [
              Icon(
                Icons.water_drop,
                size: 12,
                color: Color(0xffF6F8FF).withOpacity(0.7),
              ),
              CWText(
                text: '${hourData.precipitation.toString()}%',
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ],
          )
        ],
      ),
    );
  }
}
