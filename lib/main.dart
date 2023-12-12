import 'package:flutter/material.dart';
import 'CV_generator.dart';
import 'Landing_Page.dart';
import 'SearchPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      initialRoute: '/landing', // Specify your initial route
      routes: {
        '/landing': (context) => FirstPage(),
        '/cv_generator': (context) => CVGeneratorPage(),
        '/search': (context) => SearchPage(),
      },
    );
  }
}
