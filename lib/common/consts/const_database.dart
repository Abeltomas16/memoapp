class ConstsDatabase {
  static String DATABASE_NAME = 'dbTodo';
  static String TABLE_NAME = 'tarefas';
  static String CREATE_TAREFA_TABLE_SRCIPT =
      "CREATE TABLE tarefas(id INTEGER PRIMARY KEY,descricao TEXT,categoria TEXT, dataInicar TEXT, terminado INTEGER,dataTerminado TEXT)";
}
