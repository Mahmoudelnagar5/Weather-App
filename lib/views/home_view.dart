import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weatther_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_matching_state.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weathe_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 246, 246),
      appBar: AppBar(
        elevation: 100,
        backgroundColor: const Color(0xFF8A2BE2),
        leading: const Icon(
          Icons.location_on_outlined,
          color: Colors.white,
          size: 30,
          shadows: [
            Shadow(color: Colors.white, offset: Offset(1, 1), blurRadius: 3),
          ],
        ),
        centerTitle: true,
        title: const Text(
          'Weather',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchView()),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
              shadows: [
                Shadow(
                    color: Colors.white, offset: Offset(3, 0), blurRadius: 3),
              ],
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherSuccessState) {
            return WeatherInfoBody();
          } else if (state is WeatherFailureState)
            return const NoMatchingState();
          else
            return const NoWeatherBody();
        },
      ),
    );
  }
}
