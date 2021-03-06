import 'package:flutter/material.dart';
import 'package:memoapp/common/models/tarefas.dart';
import 'package:memoapp/common/repository/tarefas.repository.dart';
import 'package:memoapp/common/widgets/error_widget.dart';
import 'package:memoapp/common/widgets/loading_widget.dart';
import 'package:memoapp/features/Screens/ListPage/pages/list_tasks.dart';

class ContainerListar extends StatelessWidget {
  const ContainerListar({
    Key? key,
    required this.opcaomenu,
    required this.repository,
    required this.onBack,
    required this.onCadastrar,
  }) : super(key: key);
  final Map<String, String> opcaomenu;
  final TarefasRepository repository;
  final VoidCallback onBack;
  final Function(String, Map<String, String>) onCadastrar;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TarefasModel>>(
      future: repository.search(opcaomenu['nome'] as String),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return ListarTarefas(
            tarefas: snapshot.data!,
            opcaomenu: opcaomenu,
            repository: repository,
            onBack: onBack,
            onCadastrar: onCadastrar,
            onDone: (task) {
              repository.update(task, 1);
            },
            onDelete: (task) {
              repository.update(task, 2);
            },
          );
        }
        if (snapshot.hasError) {
          return ErroWidget(erro: snapshot.error as String);
        }
        return Container();
      },
    );
  }
}
