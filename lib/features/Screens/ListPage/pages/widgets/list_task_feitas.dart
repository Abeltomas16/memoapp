import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memoapp/common/models/tarefas.dart';

class TaskFeitas extends StatelessWidget {
  const TaskFeitas({
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
                    ? Dismissible(
                        key: Key(
                          _tak.id.toString(),
                        ),
                        child: CheckboxListTile(
                          title: Text(
                            _tak.descricao,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Colors.blue,
                                decoration: TextDecoration.lineThrough),
                          ),
                          subtitle: Text(
                            retornaData(_tak.dataInicar).toString(),
                          ),
                          value: true,
                          onChanged: null,
                        ),
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
