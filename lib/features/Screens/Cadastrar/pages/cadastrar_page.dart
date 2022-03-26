import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CadatrarTarefa extends StatefulWidget {
  const CadatrarTarefa({Key? key, required this.opcaomenu}) : super(key: key);
  final Map<String, String> opcaomenu;
  @override
  _CadatrarTarefaState createState() => _CadatrarTarefaState();
}

class _CadatrarTarefaState extends State<CadatrarTarefa> {
  late DateTime _dateTime;
  late String dataSelecionada = "";

  selectedDate(BuildContext contexto) async {
    final DateTime? data = await showDatePicker(
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      context: contexto,
      initialDate: _dateTime,
    );
    if (data != null) {
      setState(() {
        dataSelecionada =
            DateFormat("dd-MM-yyy hh:mm:ss").format(data).toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    dataSelecionada =
        DateFormat("dd-MM-yyy hh:mm:ss").format(_dateTime).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(),
        title: const Text(
          "Nova tarefa",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      label: Text(
                        "Oquê pretendes fazer?",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                      ),
                    ),
                    style: const TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 1),
                      TextButton(
                        onPressed: () async {
                          final DateTime? data = await showDatePicker(
                            initialDatePickerMode: DatePickerMode.day,
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2030),
                            context: context,
                            initialDate: _dateTime,
                          );
                          if (data != null) {
                            setState(() {
                              dataSelecionada = DateFormat("dd-MM-yyy hh:mm:ss")
                                  .format(data)
                                  .toString();
                            });
                          }
                        },
                        child: Text(
                          dataSelecionada,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.note,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Adicionar notas",
                              hintStyle: TextStyle(color: Colors.black38),
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(5),
              color: Colors.blue,
              width: double.infinity,
              child: const TextButton(
                child: Text(
                  "Cadastrar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
