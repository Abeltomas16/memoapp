import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memoapp/common/models/tarefas.dart';

import 'list_task_item_widget.dart';

class TaskPresentes extends StatelessWidget {
  const TaskPresentes({
    Key? key,
    required this.onDone,
    required this.tarefas,
  }) : super(key: key);
  final List<TarefasModel> tarefas;
  final Function(TarefasModel) onDone;

  DateTime retornaData(String data) {
    return DateFormat("dd-MM-yyyy").parse(data);
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
                "Presentes",
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
                DateTime data = retornaData(_tak.dataInicar);
                return (data.isAfter(DateTime.now()) && _tak.terminado == 0)
                    ? ListItemItemWidget(
                        tak: _tak,
                        stiloSubtitle: const TextStyle(),
                        onDone: onDone,
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
