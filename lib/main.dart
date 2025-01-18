import 'package:flutter/material.dart';
import 'package:google_wallet/google_wallet.dart';
import 'package:transit_card/api.dart';

void main() {
  runApp(const MyApp());
}

final wallet = GoogleWallet();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.add_card),
              onPressed: () async {
                await wallet.savePasses(GWalletAPI.formatRequest());
              },
            ),
          ],
        ),
        body: const Text('hello'),
      ),
    );
  }
}