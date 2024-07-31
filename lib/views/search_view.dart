import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weatther_cubit.dart';
import 'package:lottie/lottie.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8A2BE2),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 1, 131),
        centerTitle: true,
        title: const Text(
          'Search a city!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
              Color(0xFFFFA500),
              Color(0xFF8A2BE2),
              Color.fromARGB(255, 7, 7, 32),
            ])),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/animation_lnqy7mvh.json'),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: TextField(
                    onSubmitted: (cityName) async {
                      var fun = BlocProvider.of<GetWeatherCubit>(context);
                      fun.getWeather(cityName: cityName);

                      Navigator.of(context).pop();
                    },

                    style: const TextStyle(color: Colors.white),

                    keyboardType: TextInputType.name, //phone Yes -- pc NO

                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search, color: Colors.white),
                      labelText: 'search',
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle: const TextStyle(color: Colors.white),
                      hintText: 'Enter city name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 3,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
