import 'package:flutter/cupertino.dart';
import 'package:memoapp/common/models/categoria.dart';

class Tarefas {
  final int id;
  final String descricao;
  final Categoria categoria;
  final DateTime dataInicar;
  final bool terminado;
  final DateTime dataTerminado;

  const Tarefas({
    required this.id,
    required this.descricao,
    required this.categoria,
    required this.dataInicar,
    required this.terminado,
    required this.dataTerminado,
  });
}
