import 'package:flutter/material.dart';

class AdditionalInfoCard extends StatelessWidget {
  final IconData icon;
  final String? name;
  final double? value;
  const AdditionalInfoCard({super.key, required this.icon, this.name, this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon),
            ),
            Text(name!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value.toString()),
            )
          ],
        ),
      ),
    );
  }
}
