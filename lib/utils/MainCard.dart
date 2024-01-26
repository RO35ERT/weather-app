import 'package:flutter/material.dart';


class MainCard extends StatefulWidget {
  const MainCard({super.key});

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: Colors.black45,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("300°F",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.cloud,size: 80,),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Rain",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
