import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weatther_cubit.dart';
import 'package:weather_app/views/weather_details.dart';
import 'package:weather_app/widgets/custom_container_wedgit.dart';
import 'package:weather_app/widgets/item_list_widget.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 9, 11, 166),
            blurRadius: 10.0,
            offset: Offset(3, 3),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFA500),
            Color(0xFF8A2BE2),
            Color.fromARGB(255, 10, 10, 50),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${weatherModel.avgTemp.round()}°C',
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                weatherModel.cityName,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          Image.asset(
            getWeatherImagePath(condition: weatherModel.condtion),
            fit: BoxFit.cover,
            height: 150,
          ),
          Text(
            weatherModel.condtion,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.white,
              fontFamily: 'Pacifico',
            ),
          ),
          Text(
            DateFormat.MMMMEEEEd().format(DateTime.now()),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          CustomContainer(weatherModel: weatherModel),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Today",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const DetailsView();
                    }));
                  },
                  child: const Row(
                    children: [
                      Text(
                        "7 days ",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ItemsListView(),
        ],
      ),
    );
  }
}

String getWeatherImagePath({required String? condition}) {
  switch (condition) {
    case 'Sunny':
      return 'assets/6.png';
    case 'Partly cloudy':
      return 'assets/7.png';
    case 'Cloudy':
    case 'Overcast':
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return 'assets/8.png';
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Patchy light drizzle':
      return 'assets/2.png';
    case 'Thundery outbreaks possible':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return 'assets/3.png';
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return 'assets/5.png';
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
      return 'assets/4.png';
    case 'Ice pellets':
      return 'assets/4.png';
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return 'assets/3.png';
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return 'assets/4.png';
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return 'assets/4.png';
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return 'assets/1.png';
    default:
      return 'assets/7.png';
  }
}
