class ConstsDatabase {
  // ignore: non_constant_identifier_names
  static String DATABASE_NAME = 'dbTodo';
  // ignore: non_constant_identifier_names
  static String TABLE_NAME = 'tarefas';
  // ignore: non_constant_identifier_names
  static String CREATE_TAREFA_TABLE_SRCIPT =
      "CREATE TABLE tarefas(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,descricao TEXT,categoria TEXT, dataInicar TEXT, terminado INTEGER,dataTerminado TEXT)";
}
