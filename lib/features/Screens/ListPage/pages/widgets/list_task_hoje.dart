import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memoapp/common/models/tarefas.dart';

class TaskHoje extends StatelessWidget {
  const TaskHoje({
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
                return data.isAfter(DateTime.now())
                    ? Dismissible(
                        key: Key(
                          _tak.id.toString(),
                        ),
                        child: CheckboxListTile(
                          title: Text(
                            _tak.descricao,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            retornaData(_tak.dataInicar).toString(),
                          ),
                          value: _tak.terminado == 0 ? false : true,
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
