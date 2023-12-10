import 'package:firebase_core/firebase_core.dart';
import 'package:frontandback/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCugW3-lZ86UZ5B6R1WQOyLyy4aSlCwd1I",
          authDomain: "tests-36bc6.firebaseapp.com",
          projectId: "tests-36bc6",
          storageBucket: "tests-36bc6.appspot.com",
          messagingSenderId: "48001818562",
          appId: "1:48001818562:web:5256adbaf589e0001ec05b"
      ),
    );
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const SignInScreen(),
    );
  }
}