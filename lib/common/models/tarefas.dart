import 'package:flutter/cupertino.dart';
import 'package:memoapp/common/models/categoria.dart';

class TarefasModel {
  late int id;
  final String descricao;
  final String categoria;
  final String dataInicar;
  final int terminado;
  final String dataTerminado;

  TarefasModel({
    required this.id,
    required this.descricao,
    required this.categoria,
    required this.dataInicar,
    required this.terminado,
    required this.dataTerminado,
  });
  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'descricao': descricao,
      'categoria': categoria,
      'dataInicar': dataInicar,
      'terminado': terminado,
      'dataTerminado': dataTerminado
    };
  }
}
