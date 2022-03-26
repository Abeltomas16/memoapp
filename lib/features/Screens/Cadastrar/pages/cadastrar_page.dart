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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                maxLines: 4,
                autofocus: true,
                decoration: const InputDecoration(
                  label: Text("oquê pretendes fazer?"),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black87),
                ),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Icon(
                    Icons.notifications,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      selectedDate(context);
                    },
                    child: Text(dataSelecionada),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
