import 'package:flutter/material.dart';
import 'Landing_Page.dart';  // Import your FirstPage widget
import 'CV_generator.dart';  // Import your CVGeneratorPage widget
import 'CV_correction.dart';  // Import your CVCorrector widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oppor\'Tune',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Change the primary color
        hintColor: Colors.blue, // Change the accent color
        fontFamily: 'Roboto', // Use a custom font (make sure to include it in your pubspec.yaml)
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey, // Change the app bar color
          titleTextStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/generate_cv': (context) => CVGeneratorPage(),
        '/correct_cv': (context) => CVCorrector(),
      },
    );
  }
}