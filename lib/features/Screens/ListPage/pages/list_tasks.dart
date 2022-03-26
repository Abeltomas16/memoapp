import 'package:flutter/material.dart';
import 'package:memoapp/common/models/tarefas.dart';

class ListarTarefas extends StatelessWidget {
  const ListarTarefas(
      {Key? key, required this.tarefas, required this.opcaomenu})
      : super(key: key);
  final List<TarefasModel> tarefas;
  final Map<String, String> opcaomenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste"),
      ),
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tarefas[index].descricao),
          );
        },
      ),
    );
  }
}
