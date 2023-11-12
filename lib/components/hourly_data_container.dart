import 'package:cuwea/components/single_hour_info.dart';
import 'package:cuwea/models/hour_data.dart';
import 'package:flutter/material.dart';

class HourlyDataContainer extends StatelessWidget {
  final List<HourData> hourlyData;

  const HourlyDataContainer({
    super.key,
    required this.hourlyData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9).withOpacity(0.33),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyData.length,
        itemBuilder: (context, index) => SingleHourDataWidget(
          hourData: hourlyData[index],
        ),
      ),
    );
  }
}
