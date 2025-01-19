import 'package:flutter/material.dart';
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
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.add_card),
              onPressed: () async {

              },
            ),
          ],
        ),
        body: GoogleWalletButton(
          style: GoogleWalletButtonStyle.condensed,
          onPressed: () async {
            await wallet.savePasses(GWalletAPI.formatRequest());
          },
        ),
      ),
    );
  }
}