import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_app/pages/HomePage.dart';

Future main () async{
  await dotenv.load();
  runApp(
    const MaterialApp(
      home: HomePage(),
    )
  );
}