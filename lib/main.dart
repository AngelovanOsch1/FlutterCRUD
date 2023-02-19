import 'package:crud/screens/Login.dart';
import 'package:crud/screens/home.dart';
import 'package:crud/screens/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/signup': (context) => const Signup(),
        '/login': (context) => const Login(),
      },
    );
  }
}
