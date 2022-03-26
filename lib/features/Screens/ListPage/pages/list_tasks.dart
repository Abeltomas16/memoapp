import 'package:flutter/material.dart';
import 'package:memoapp/common/models/tarefas.dart';
import 'package:memoapp/features/Screens/ListPage/pages/widgets/list_app_bar.dart';
import 'package:memoapp/features/Screens/ListPage/pages/widgets/list_task_item_widget.dart';

class ListarTarefas extends StatefulWidget {
  const ListarTarefas({
    Key? key,
    required this.tarefas,
    required this.opcaomenu,
    required this.onBack,
    required this.onCadastrar,
  }) : super(key: key);
  final List<TarefasModel> tarefas;
  final Map<String, String> opcaomenu;
  final VoidCallback onBack;
  final Function(String, Map<String, String>) onCadastrar;
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
            ListItemTaskWidget(tarefa: widget.opcaomenu),
            SliverToBoxAdapter(
                child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: widget.tarefas.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                        key: Key(
                          widget.tarefas[index].id.toString(),
                        ),
                        child: CheckboxListTile(
                            title: Text(
                                widget.tarefas[index].descricao.toString()),
                            value: widget.tarefas[index].terminado == 0
                                ? false
                                : true,
                            onChanged: null));
                  },
                ),
              ),
            ))
          ],
        ));
  }
}
