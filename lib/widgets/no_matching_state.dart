import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoMatchingState extends StatelessWidget {
  const NoMatchingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(
              'assets/Animation_1722168927653.json',
              fit: BoxFit.fill,
            ),
            const Text(
              "No matching location !!",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 30,
              ),
            ),
            const Text(
              "Try again !",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
