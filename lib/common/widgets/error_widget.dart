import 'package:flutter/material.dart';

class ErroWidget extends StatelessWidget {
  const ErroWidget({Key? key, required this.erro}) : super(key: key);
  final String erro;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(erro),
      ),
    );
  }
}
