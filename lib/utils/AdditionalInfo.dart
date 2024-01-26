import 'package:flutter/material.dart';
import 'package:my_app/utils/AdditionalInfoCard.dart';

class AdditionalInfo extends StatelessWidget {
  final double humidity;
  final double pressure;
  final double windSpeed;
  const AdditionalInfo({super.key, required this.humidity, required this.pressure, required this.windSpeed});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AdditionalInfoCard(name: "Humidity",value: humidity,icon: Icons.water_drop,),
          ),
          AdditionalInfoCard(name: "Wind Speed",value: windSpeed,icon: Icons.air,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AdditionalInfoCard(name: "Pressure",value: pressure,icon:Icons.compress,),
          ),
        ],
      ),
    );
  }
}
