import 'package:flutter/material.dart';

import 'package:transit_card/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_wallet/google_wallet.dart';
import 'package:transit_card/api.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final wallet = GoogleWallet();
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