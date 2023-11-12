import 'package:cuwea/components/single_forecast_info.dart';
import 'package:cuwea/models/forecast_data.dart';
import 'package:flutter/material.dart';

class ForecastDataContainer extends StatelessWidget {
  final List<ForecastData> forecastData;

  const ForecastDataContainer({
    super.key,
    required this.forecastData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9).withOpacity(0.33),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: forecastData.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: SingleForecastWidget(
            forecastData: forecastData[index],
          ),
        ),
      ),
    );
  }
}
