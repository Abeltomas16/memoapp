import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memoapp/common/models/tarefas.dart';

class ListItemItemWidget extends StatelessWidget {
  const ListItemItemWidget({
    Key? key,
    required this.tak,
    required this.stiloSubtitle,
    required this.onDone,
  }) : super(key: key);
  final TarefasModel tak;
  final TextStyle stiloSubtitle;
  final Function(TarefasModel) onDone;
  DateTime retornaData(String data) {
    return DateFormat("dd-MM-yyyy").parse(data);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(
        tak.id.toString(),
      ),
      child: CheckboxListTile(
        title: Text(
          tak.descricao,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          retornaData(tak.dataInicar).toString(),
          style: stiloSubtitle,
        ),
        value: tak.terminado == 0 ? false : true,
        onChanged: null,
      ),
      onDismissed: (direction) {
        onDone(tak);
      },
    );
  }
}
