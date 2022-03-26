import 'package:flutter/material.dart';
import 'package:memoapp/common/repository/tarefas.repository.dart';
import 'package:memoapp/features/Screens/Cadastrar/pages/cadastrar_page.dart';
import 'package:memoapp/features/Screens/ListPage/container/container_list.dart';

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
              ontap: (rota, args) {
                Navigator.of(context).pushNamed(rota, arguments: args);
              },
            ),
          );
        }
        if (settings.name == '/list') {
          return MaterialPageRoute(
            builder: (context) => ContainerListar(
              opcaomenu: settings.arguments as Map<String, String>,
              repository: repository,
              onBack: () => Navigator.of(context).pop(),
              onCadastrar: (rota, args) {
                Navigator.of(context).pushNamed(rota, arguments: args);
              },
            ),
          );
        }
        if (settings.name == '/cadastrar') {
          return MaterialPageRoute(
            builder: (context) => CadatrarTarefa(
              opcaomenu: settings.arguments as Map<String, String>,
            ),
          );
        }
      },
    );
  }
}
