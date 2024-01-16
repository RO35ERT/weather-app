import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_app/pages/HomePage.dart';

Future<void> main () async{
  await dotenv.load(fileName: ".env");
  runApp(
    const MaterialApp(
      home: HomePage(),
    )
  );
}