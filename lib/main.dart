import 'package:flutter/material.dart';
import 'Landing_Page.dart';
import 'CV_correction.dart';
import 'CV_generator.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV Corrector App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
      routes: {
        '/generate_cv': (context) => CVGeneratorPage(),
        '/correct_cv': (context) => CVCorrector(),
      },
    );
  }
}


