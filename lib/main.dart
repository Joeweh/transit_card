import 'package:flutter/material.dart';
import 'package:transit_card/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(218, 218, 218, 1.0),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}