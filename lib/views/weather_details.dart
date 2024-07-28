import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weatther_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/cart_list_view.dart';
import 'package:weather_app/widgets/container_of_week.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              Text(
                " 7 days",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF8A2BE2),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 8, 7, 9),
            ),
            child: Column(
              children: [
                Mycontainter(weatherModel: weatherModel),
                CardsListView(weatherModel: weatherModel)
              ],
            ),
          ),
        ));
  }
}
