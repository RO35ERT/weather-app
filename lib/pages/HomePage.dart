import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
var apiKey = "eb66d86c1805bbcfdab91296b08f9008";
var city = "Lusaka";
late Map<String, dynamic> weatherData;
Future<void> fetchData() async {
  final response = await http.get(
    Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey'),
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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Container(
                color: Colors.indigo,
                padding: const EdgeInsets.all(16),
                child: const Text("Hello Weather"),
              ),
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Container(
                color: Colors.indigo,
                padding: const EdgeInsets.all(16),
                child: const Text("Hello Weather1"),
              ),

            ),

          ],
        ),
      ),
    );
  }
}
