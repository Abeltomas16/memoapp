import 'package:intl/intl.dart';
import 'package:memoapp/common/consts/const_database.dart';
import 'package:memoapp/common/models/tarefas.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TarefasRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), ConstsDatabase.DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(ConstsDatabase.CREATE_TAREFA_TABLE_SRCIPT);
      },
      version: 1,
    );
  }

  Future insert(TarefasModel model) async {
    try {
      final database = await _getDatabase();
      await database.insert(ConstsDatabase.TABLE_NAME, model.toMap());
    } catch (e) {
      throw Exception("Erro ao inserir");
    }
  }

  Future<List<TarefasModel>> getAllTarefas() async {
    try {
      final database = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await database.query(ConstsDatabase.TABLE_NAME);

      return List.generate(maps.length, (index) {
        return TarefasModel(
          id: maps[index]['id'],
          descricao: maps[index]['descricao'],
          categoria: maps[index]['categoria'],
          dataInicar: maps[index]['dataInicar'],
          terminado: maps[index]['terminado'],
          dataTerminado: maps[index]['dataTerminado'],
        );
      });
    } catch (e) {
      throw Exception("Erro ao Listar");
    }
  }

  Future<List<TarefasModel>> search(String categoria) async {
    try {
      List<Map<String, dynamic>> maps = [];
      final database = await _getDatabase();
      if (categoria.toLowerCase() == "all") {
        maps = await database.query(ConstsDatabase.TABLE_NAME);
      } else {
        maps = await database.query(
          ConstsDatabase.TABLE_NAME,
          where: "categoria LIKE ?",
          whereArgs: ['%$categoria%'],
        );
      }

      return List.generate(maps.length, (index) {
        return TarefasModel(
          id: maps[index]['id'],
          descricao: maps[index]['descricao'],
          categoria: maps[index]['categoria'],
          dataInicar: maps[index]['dataInicar'],
          terminado: maps[index]['terminado'],
          dataTerminado: maps[index]['dataTerminado'],
        );
      });
    } catch (e) {
      throw Exception("Erro ao Pesquisar");
    }
  }

  DateTime retornaData(String data) {
    return DateFormat("dd-MM-yyy hh:mm:ss").parse(data);
  }

  Future update(TarefasModel model) async {
    try {
      TarefasModel modelo = TarefasModel(
        id: model.id,
        descricao: model.descricao,
        categoria: model.categoria,
        dataInicar: model.dataInicar,
        terminado: 1,
        dataTerminado: retornaData(model.dataTerminado).toString(),
      );
      final database = await _getDatabase();
      await database.update(
        ConstsDatabase.TABLE_NAME,
        modelo.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
      );
    } catch (e) {
      throw Exception("Erro ao Actualizar");
    }
  }
}
