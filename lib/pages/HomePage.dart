import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_app/constants/secret.dart';
import 'package:my_app/utils/AdditionalInfo.dart';
import 'package:my_app/utils/Forecast.dart';
import 'package:my_app/utils/ForecastCard.dart';
import 'package:my_app/utils/MainCard.dart';
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


  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=Lusaka&appid=$API_KEY'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){}, icon: const Icon(Icons.refresh)),
          )
        ],
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if(snapshot.hasError){
            return const Center(child: Text("Failed to fetch data"),);
          }

          var data = snapshot.data?['list'];
          var temp = data[0]['main']['temp'];
          var weather = data[0]['weather'][0]['main'];
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainCard(
                  weather: weather,
                  temperature: kelvinToCelsius(temp).toStringAsFixed(2),
                  icon: weather =="Rain"|| weather =="Clouds" ? Icons.cloud : Icons.sunny,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Hourly Forecast", style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),),
                ),
                const SizedBox(
                  height: 30,
                ),
                Forecast(data: data),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Additional Information", style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AdditionalInfo(
                      humidity:double.parse(data[0]['main']['humidity'].toString()),
                      pressure: double.parse(data[0]['main']['pressure'].toString()),
                      windSpeed: double.parse(data[0]['wind']['speed'].toString()),
                    ),
                  ),
                )
              ],
            ),
          );
        },

      )

    );
  }
}