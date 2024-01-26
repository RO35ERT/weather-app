import 'package:flutter/material.dart';
import 'package:my_app/utils/ForecastCard.dart';

class Forecast extends StatefulWidget {
  const Forecast({super.key});

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ForecastCard(),
          ForecastCard(),
          ForecastCard(),
          ForecastCard(),
          ForecastCard(),
          ForecastCard(),
          ForecastCard(),
          ForecastCard(),
        ],
      ),
    );
  }
}
