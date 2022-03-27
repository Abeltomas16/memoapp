import 'package:flutter/material.dart';
import 'package:memoapp/common/models/tarefas.dart';
import 'package:memoapp/features/Screens/ListPage/pages/widgets/list_app_bar.dart';
import 'package:memoapp/features/Screens/ListPage/pages/widgets/list_task_atrasadas.dart';
import 'package:memoapp/features/Screens/ListPage/pages/widgets/list_task_header_widget.dart';

import 'widgets/list_task_feitas.dart';
import 'widgets/list_task_hoje.dart';

class ListarTarefas extends StatefulWidget {
  const ListarTarefas({
    Key? key,
    required this.tarefas,
    required this.opcaomenu,
    required this.onBack,
    required this.onCadastrar,
    required this.onDone,
    required this.onDelete,
  }) : super(key: key);
  final List<TarefasModel> tarefas;
  final Map<String, String> opcaomenu;
  final VoidCallback onBack;
  final Function(String, Map<String, String>) onCadastrar;
  final Function(TarefasModel) onDone;
  final Function(TarefasModel) onDelete;
  @override
  State<ListarTarefas> createState() => _ListarTarefasState();
}

class _ListarTarefasState extends State<ListarTarefas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.onCadastrar('/cadastrar', widget.opcaomenu);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          ListAppbar(onBack: widget.onBack),
          ListItemHeaderWidget(tarefa: widget.opcaomenu),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 5.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: TaskAtrasadas(
                        tarefas: widget.tarefas,
                        onDone: widget.onDone,
                      ),
                    ),
                    Expanded(
                      child: TaskHoje(
                        tarefas: widget.tarefas,
                      ),
                    ),
                    Expanded(
                      child: TaskFeitas(
                        tarefas: widget.tarefas,
                        onDelete: widget.onDelete,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
