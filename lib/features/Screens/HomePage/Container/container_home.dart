import 'package:flutter/material.dart';
import 'package:memoapp/common/models/tarefas.dart';
import 'package:memoapp/common/repository/tarefas.repository.dart';
import 'package:memoapp/common/widgets/error_widget.dart';
import 'package:memoapp/common/widgets/loading_widget.dart';
import 'package:memoapp/features/Screens/HomePage/pages/home_page.dart';

class ContainerHome extends StatelessWidget {
  const ContainerHome({Key? key, required this.repository}) : super(key: key);
  final TarefasRepository repository;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TarefasModel>>(
      future: repository.getAllTarefas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return const HomePage();
        }
        if (snapshot.hasError) {
          return ErroWidget(erro: snapshot.error as String);
        }
        return Container();
      },
    );
  }
}
