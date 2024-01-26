import 'package:flutter/material.dart';


class MainCard extends StatelessWidget {
  final String? temperature;
  final String? weather;
  final IconData icon;
  const MainCard({super.key, required this.weather, this.temperature, required this.icon});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: Colors.black45,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${temperature != null?temperature.toString():0}°C",
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon,size: 80,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(weather!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
