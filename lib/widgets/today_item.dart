import 'package:flutter/material.dart';

class TodayItem extends StatelessWidget {
  const TodayItem({
    super.key,
    required this.degree,
    required this.time,
    required this.imagePath,
  });
  final double degree;
  final String time;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
          border: Border.all(width: 0.2, color: Colors.white),
          borderRadius: BorderRadius.circular(35)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            time,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Image(
            image: AssetImage(imagePath),
            width: 50,
            height: 35,
          ),
          const SizedBox(height: 5),
          Text(
            '$degree°',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
