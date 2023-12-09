import 'package:flutter/material.dart';
import 'firstpage.dart'; // Import your FirstPage class
import 'cvgen.dart'; // Import your CVGeneratorPage class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OPPOR\'TUNE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/generate_cv': (context) => CVGeneratorPage(),
        // Add more routes if needed
      },
    );
  }
}
