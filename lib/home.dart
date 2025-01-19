import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_wallet/google_wallet.dart';
import 'package:transit_card/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Color> _colors = [ Colors.green, Colors.red ];
  final List<String> _titles = [ "MBTA 505236", "SQ*MAMACITAS AUT..." ];
  final List<String> _costs = [ "\$2.40", "\$13.38" ];

  final wallet = GoogleWallet();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        shape: const CircleBorder(),
        backgroundColor: const Color.fromRGBO(154, 221, 255, 1),
        child: Image.asset(
          "assets/images/logos/logo.png",
        ),
        onPressed: () {

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height / 8.65,
        shape: const CircularNotchedRectangle(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IconButton(
                    iconSize: 40,
                    icon: const Icon(
                      Icons.language,
                    ),
                    onPressed: () {

                    },
                  ),
                  const Text(
                    'Explore',
                  ),
                ],
              ),
              const Column(
                spacing: 1.75,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 36.75,
                  ),
                  Text(
                    'Pay',
                  ),
                  Text(
                    'Balance',
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    iconSize: 40,
                    icon: const Icon(
                      Icons.verified,
                    ),
                    onPressed: () {

                    },
                  ),
                  const Text(
                    'Points',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/text-logos/portal-invert.png",
                      scale: 1.5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Image.asset(
                "assets/images/cards/PortalCardBackShadow.png",
                scale: 2.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(154, 221, 255, 1),
                        border: Border(
                          top: BorderSide(
                            style: BorderStyle.none,
                          ),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12.5),
                        margin: const EdgeInsets.fromLTRB(22, 0.0, 0.0, 0.0),
                        child: const Text(
                          'Balance',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0.0, 20.0, 22.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GoogleWalletButton(
                            style: GoogleWalletButtonStyle.condensed,
                            onPressed: () async {
                              await wallet.savePasses(GWalletAPI.formatRequest());
                            },
                          ),
                          const Text(
                            '\$29.34',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 17,
                                      height: 17,
                                      child: ColoredBox(color: _colors[index]),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      _titles[index],
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  _costs[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
