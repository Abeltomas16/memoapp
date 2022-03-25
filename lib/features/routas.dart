import 'package:flutter/material.dart';

import 'Screens/HomePage/Container/container_home.dart';

class Rotas extends StatelessWidget {
  const Rotas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
              builder: (context) => const ContainerHome(),
              fullscreenDialog: true);
        }
      },
    );
  }
}
