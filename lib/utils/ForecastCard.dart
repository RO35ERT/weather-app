import 'package:flutter/material.dart';

class ForecastCard extends StatefulWidget {
  const ForecastCard({super.key});

  @override
  State<ForecastCard> createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 175,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("09:00", style: TextStyle(fontSize: 24),),
            ),
            Icon(Icons.cloud),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("301.17",style: TextStyle(fontSize: 24),),
            )
          ],
        ),
      ),
    );
  }
}
