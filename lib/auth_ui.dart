import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transit_card/home.dart';

class AuthUI extends StatefulWidget {
  const AuthUI({super.key});

  @override
  State<AuthUI> createState() => _AuthUIState();
}

class _AuthUIState extends State<AuthUI> {
  final _loginKey = GlobalKey<FormState>();
  final _registerKey = GlobalKey<FormState>();

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

  Widget _buildLoginForm() {
    return Form(
      key: _loginKey,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 350,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 350,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
          const SizedBox(
            height: 34.5,
          ),
          FilledButton(
            style: const ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(Color.fromRGBO(154, 221, 255, 1)),
              fixedSize: WidgetStatePropertyAll(Size(300, 75)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Form(
      key: _registerKey,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 350,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 350,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
          const SizedBox(
            height: 34.5,
          ),
          FilledButton(
            style: const ButtonStyle(
              backgroundColor:
              WidgetStatePropertyAll(Color.fromRGBO(154, 221, 255, 1)),
              fixedSize: WidgetStatePropertyAll(Size(300, 75)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: const Text(
              'Register',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0)),
          ),
          toolbarHeight: 207,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 15,
              ),
              Stack(
                //alignment: Alignment.centerRight,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 0.0),
                    child: Image.asset(
                      'assets/images/cards/PortalCardFrontShadowLOL.png',
                      scale: 1.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(50.0, 12.0, 0.0, 0.0),
                    child: const Column(
                      children: [
                        Text(
                          'Portal',
                          style: TextStyle(
                            fontSize: 36,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Card',
                          style: TextStyle(
                            fontSize: 36,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          bottom: const TabBar(
            labelColor: Colors.blue,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [_buildLoginForm(), _buildRegisterForm()],
        ),
      ),
    );
  }
}
