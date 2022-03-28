import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memoapp/common/models/tarefas.dart';
import 'package:memoapp/features/Screens/ListPage/pages/widgets/list_task_item_widget.dart';

class TaskFeitas extends StatelessWidget {
  const TaskFeitas({
    Key? key,
    required this.tarefas,
    required this.onDelete,
  }) : super(key: key);
  final List<TarefasModel> tarefas;
  final Function(TarefasModel) onDelete;
  DateTime retornaData(String data) {
    return DateFormat("dd-MM-yyy").parse(data);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 17.0),
              child: Text(
                "Feitas",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                TarefasModel _tak = tarefas[index];
                bool feita = _tak.terminado == 1;
                return feita
                    ? ListItemItemWidget(
                        tak: _tak,
                        stiloSubtitle: const TextStyle(color: Colors.red),
                        onDone: onDelete,
                      )
                    : Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
