import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apiKey = dotenv.env['API_KEY'];
  late String city = "Lusaka";
  late Map<String, dynamic>? weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = {};
    city = "Lusaka";
    fetchData();
  }

  double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }

  void updateCity(String newCity) {
    setState(() {
      city = newCity;
    });
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=Lusaka&appid=eb66d86c1805bbcfdab91296b08f9008'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          weatherData = data;
        });
    } else {
      throw Exception('Failed to load weather data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const Center(
        child: Column(

        ),
      ),
    );
  }
}