import 'package:flutter/material.dart';
import 'package:memoapp/common/consts/const_app.dart';
import 'package:memoapp/features/Screens/HomePage/pages/widgets/opcoes_menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.ontap}) : super(key: key);
  final Function(String, Map<String, String>) ontap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 40,
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tarefas",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      stops: [0.3, 1],
                      colors: [
                        Color.fromRGBO(237, 243, 255, 0.4),
                        Color.fromRGBO(237, 243, 255, 0.4),
                      ],
                    ),
                  ),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: ConstApp.opcoes
                        .map((e) => OpcoesMenu(
                              tarefa: e,
                              ontap: ontap,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
