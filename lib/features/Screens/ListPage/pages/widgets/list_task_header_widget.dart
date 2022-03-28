import 'package:flutter/material.dart';
import 'package:memoapp/common/repository/tarefas.repository.dart';
import 'package:memoapp/common/widgets/loading_widget.dart';

class ListItemHeaderWidget extends StatefulWidget {
  const ListItemHeaderWidget({
    Key? key,
    required this.tarefa,
    required this.repository,
  }) : super(key: key);
  final Map<String, String> tarefa;
  final TarefasRepository repository;
  @override
  State<ListItemHeaderWidget> createState() => _ListItemHeaderWidgetState();
}

class _ListItemHeaderWidgetState extends State<ListItemHeaderWidget> {
  int total = 0;
  @override
  void initState() {
    super.initState();
  }

  loadTipo(tipo) {
    widget.repository.searchTotalItem(tipo).then((value) {
      if (mounted) {
        setState(
          () {
            total = value;
          },
        );
      }
    }).toString();
  }

  @override
  Widget build(BuildContext context) {
    loadTipo(widget.tarefa.values.first);
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  )),
              child: Hero(
                tag: widget.tarefa.values.first,
                child: Image.asset(
                  widget.tarefa.values.last,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                widget.tarefa.values.first,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 3),
            total != -1
                ? Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      "${total.toString()} tarefas",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
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
