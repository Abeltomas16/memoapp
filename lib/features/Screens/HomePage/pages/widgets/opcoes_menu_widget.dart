import 'package:flutter/material.dart';

class OpcoesMenu extends StatelessWidget {
  const OpcoesMenu({Key? key, required this.tarefa}) : super(key: key);
  final Map<String, String> tarefa;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              flex: 1,
              child: Image.asset(
                tarefa.values.last,
                height: 35,
              )),
          const SizedBox(height: 15),
          Text(
            tarefa.values.first,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            "150 tarefas",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
