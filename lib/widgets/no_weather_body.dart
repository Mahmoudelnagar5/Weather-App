import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
      child: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/home.png',
            ),
            const Text(
              'There is no weather',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            const Text(
              '    Start searching now 🔍 !',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
