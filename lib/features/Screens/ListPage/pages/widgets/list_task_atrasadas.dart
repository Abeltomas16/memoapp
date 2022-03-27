import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memoapp/common/models/tarefas.dart';
import 'package:memoapp/features/Screens/ListPage/pages/widgets/list_task_item_widget.dart';

class TaskAtrasadas extends StatelessWidget {
  const TaskAtrasadas({
    Key? key,
    required this.tarefas,
  }) : super(key: key);
  final List<TarefasModel> tarefas;
  DateTime retornaData(String data) {
    return DateFormat("dd-MM-yyy hh:mm:ss").parse(data);
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
                "Atrasadas",
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
                return data.isBefore(DateTime.now())
                    ? ListItemItemWidget(
                        tak: _tak,
                        stiloSubtitle: const TextStyle(color: Colors.red),
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
