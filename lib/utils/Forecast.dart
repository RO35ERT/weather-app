import 'package:flutter/material.dart';
import 'package:my_app/utils/ForecastCard.dart';
import 'package:intl/intl.dart';

class Forecast extends StatelessWidget {
  final dynamic data;
  Forecast({super.key, required this.data});

  double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 170,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length-1,
            itemBuilder: (context, index){
              final date = DateTime.parse(data[index+1]["dt_txt"]);
              String value = data[index+1]['weather'][0]['main'];
              return ForecastCard(
                temp: kelvinToCelsius(data[index+1]['main']['temp']).toStringAsFixed(2),
                time: DateFormat.Hm().format(date).toString(),
                icon: value != "Clouds"||value != "Rain" ? Icons.sunny : Icons.cloud,
              );
            }),
      ),
    );
  }
}
