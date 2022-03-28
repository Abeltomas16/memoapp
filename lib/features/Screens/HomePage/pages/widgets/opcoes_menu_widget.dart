import 'package:flutter/material.dart';
import 'package:memoapp/common/repository/tarefas.repository.dart';
import 'package:memoapp/common/widgets/loading_widget.dart';

class OpcoesMenu extends StatefulWidget {
  const OpcoesMenu({
    Key? key,
    required this.tarefa,
    required this.ontap,
    required this.repository,
  }) : super(key: key);
  final Map<String, String> tarefa;
  final Function(String, Map<String, String>) ontap;
  final TarefasRepository repository;

  @override
  State<OpcoesMenu> createState() => _OpcoesMenuState();
}

class _OpcoesMenuState extends State<OpcoesMenu> {
  int total = -1;
  loadTipo(tipo) {
    widget.repository.searchTotalItem(tipo).then((value) {
      setState(() {
        total = value;
      });
    }).toString();
  }

  @override
  Widget build(BuildContext context) {
    loadTipo(widget.tarefa.values.first);
    return GestureDetector(
      onTap: () {
        widget.ontap('/list', widget.tarefa);
      },
      child: Container(
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
                child: Hero(
                  tag: widget.tarefa.values.first,
                  child: Image.asset(
                    widget.tarefa.values.last,
                    height: 35,
                  ),
                )),
            const SizedBox(height: 15),
            Text(
              widget.tarefa.values.first,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 3),
            total != -1
                ? Text(
                    total.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  )
                : const Flexible(
                    child: LoadingWidget(),
                  ),
          ],
        ),
      ),
    );
  }
}
