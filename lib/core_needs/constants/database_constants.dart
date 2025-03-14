sealed class TableNameConstant{
  static const String tTask="task";
}

sealed class CreateTableConstant{
  static const String cTask='''
  CREATE TABLE IF NOT EXISTS ${TableNameConstant.tTask} (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  description TEXT,
  dueDate INTEGER NOT NULL,
  taskCategory TEXT NOT NULL,
  priority TEXT NOT NULL,
  repeat TEXT NOT NULL,
  repeatList TEXT,
  confirmed TEXT,
  status TEXT
  )
  ''';
}
