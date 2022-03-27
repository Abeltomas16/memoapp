import 'package:flutter/material.dart';

class ListItemHeaderWidget extends StatelessWidget {
  const ListItemHeaderWidget({Key? key, required this.tarefa})
      : super(key: key);
  final Map<String, String> tarefa;
  @override
  Widget build(BuildContext context) {
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
                tag: tarefa.values.first,
                child: Image.asset(
                  tarefa.values.last,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                tarefa.values.first,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 3),
            const Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Text(
                "150 tarefas",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
