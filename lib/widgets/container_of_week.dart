import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/custom_container_wedgit.dart';
import 'package:weather_app/widgets/weathe_info_body.dart';

class Mycontainter extends StatelessWidget {
  const Mycontainter({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    List<Day> tomorrow = weatherModel.days;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF8A2BE2),
            Color(0xFFFFA500),
            // Color.fromARGB(255, 13, 223, 255),
            // Color.fromARGB(255, 100, 109, 188),
          ],
        ),
      ),
      height: 360,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  getWeatherImagePath(condition: tomorrow[1].condition),
                  height: 120,
                ),
                Column(
                  children: [
                    const Text('Tomorrrow',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      tomorrow[1].condition,
                      style: const TextStyle(
                        fontSize: 25,
                        fontFamily: 'pacifico',
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Text(
              '${tomorrow[1].avgTemp.toInt()}°',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomContainer(weatherModel: weatherModel),
          ],
        ),
      ),
    );
  }
}
