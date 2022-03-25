import 'package:flutter/material.dart';
import 'package:memoapp/common/widgets/error_widget.dart';
import 'package:memoapp/common/widgets/loading_widget.dart';
import 'package:memoapp/features/Screens/HomePage/pages/home_page.dart';

class ContainerHome extends StatelessWidget {
  const ContainerHome({Key? key}) : super(key: key);
  Future<List<Map<String, String>>> retornaOpces() async {
    final List<Map<String, String>> teste = [];
    return await Future.delayed(
        const Duration(seconds: 2), () => teste.toList());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: retornaOpces(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return const HomePage();
        }
        if (snapshot.hasError) {
          return ErroWidget(erro: snapshot.error as String);
        }
        return Container();
      },
    );
  }
}
