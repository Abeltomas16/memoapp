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
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ContainerHome(
                repository: repository,
                ontap: (rota, args) {
                  Navigator.of(context).pushNamed(rota, arguments: args);
                },
              );
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 2000),
          );
        }
        if (settings.name == '/list') {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ContainerListar(
                opcaomenu: settings.arguments as Map<String, String>,
                repository: repository,
                onBack: () => Navigator.of(context).pop(),
                onCadastrar: (rota, args) {
                  Navigator.of(context).pushNamed(rota, arguments: args);
                },
              );
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 2000),
          );
        }
        if (settings.name == '/cadastrar') {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return CadatrarTarefa(
                opcaomenu: settings.arguments as Map<String, String>,
              );
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 700),
          );
        }
      },
    );
  }
}
