import 'package:curancy_converter_app/screens/Homepage.dart';
import 'package:curancy_converter_app/screens/secondpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Homepage(),
        'secondpage': (context) => const secondpage(),
      },
    ),
  );
}
