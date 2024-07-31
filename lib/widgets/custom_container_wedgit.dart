import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/custom_column.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF8A2BE2),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 21, 19, 31).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: 120,
      width: 360,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomColumn(
            value: '${weatherModel.preciptation}',
            imagePath: 'assets/protection.png',
            text: 'Precipitation',
          ),
          CustomColumn(
            text: 'Humidity',
            value: '${weatherModel.humdity} %',
            imagePath: 'assets/humidity.png',
          ),
          CustomColumn(
            text: 'Wind speed',
            value: '${weatherModel.windSpeed} %',
            imagePath: 'assets/air.png',
          ),
        ],
      ),
    );
  }
}
