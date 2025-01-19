import 'package:flutter/material.dart';
import 'package:transit_card/auth_ui.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(218, 218, 218, 1.0),
        useMaterial3: true,
      ),
      home: const AuthUI(),
      debugShowCheckedModeBanner: false,
    );
  }
}