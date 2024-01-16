import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
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
