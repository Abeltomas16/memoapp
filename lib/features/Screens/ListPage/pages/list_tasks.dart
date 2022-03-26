import 'package:flutter/material.dart';
import 'package:memoapp/common/models/tarefas.dart';
import 'package:memoapp/features/Screens/ListPage/pages/widgets/list_app_bar.dart';
import 'package:memoapp/features/Screens/ListPage/pages/widgets/list_task_item_widget.dart';

class ListarTarefas extends StatelessWidget {
  const ListarTarefas({
    Key? key,
    required this.tarefas,
    required this.opcaomenu,
    required this.onBack,
  }) : super(key: key);
  final List<TarefasModel> tarefas;
  final Map<String, String> opcaomenu;
  final VoidCallback onBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
        ),
        body: CustomScrollView(
          slivers: [
            ListAppbar(onBack: onBack),
            ListItemTaskWidget(tarefa: opcaomenu),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                ),
              ),
            )
          ],
        ));
  }
}
