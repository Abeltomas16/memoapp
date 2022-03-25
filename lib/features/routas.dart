import 'package:flutter/material.dart';
import 'package:memoapp/common/repository/tarefas.repository.dart';

import 'Screens/HomePage/Container/container_home.dart';

class Rotas extends StatelessWidget {
  const Rotas({Key? key, required this.repository}) : super(key: key);
  final TarefasRepository repository;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
              builder: (context) => ContainerHome(
                    repository: repository,
                  ),
              fullscreenDialog: true);
        }
      },
    );
  }
}
