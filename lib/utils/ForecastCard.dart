import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  final String time;
  final String temp;
  final IconData icon;
  const ForecastCard({super.key, required this.time, required this.temp, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 175,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(time, style: const TextStyle(fontSize: 24),),
            ),
            Icon(icon),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(temp,style: const TextStyle(fontSize: 24),),
            )
          ],
        ),
      ),
    );
  }
}
