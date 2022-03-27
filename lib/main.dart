import 'package:flutter/material.dart';
import 'package:memoapp/common/repository/tarefas.repository.dart';
import 'package:memoapp/features/Screens/HomePage/pages/home_page.dart';
import 'package:memoapp/features/routas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFF5F5F5),
      ),
      home: Rotas(repository: TarefasRepository()),
    );
  }
}
