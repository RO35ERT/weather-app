import 'package:flutter/material.dart';

class AdditionalInfoCard extends StatefulWidget {
  const AdditionalInfoCard({super.key});

  @override
  State<AdditionalInfoCard> createState() => _AdditionalInfoCardState();
}

class _AdditionalInfoCardState extends State<AdditionalInfoCard> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 150,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.water_drop),
            ),
            Text("Humidity"),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("95"),
            )
          ],
        ),
      ),
    );
  }
}
