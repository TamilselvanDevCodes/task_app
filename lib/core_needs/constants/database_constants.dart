sealed class TableNameConstant{
  static const String tTask="task";
  static const String tNotification="notification";
}

sealed class CreateTableConstant{
  static const String cTask = '''
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
  status TEXT,
  remarks TEXT, 
  completedDate INTEGER
  )
''';

  static const String cNotification = '''
CREATE TABLE IF NOT EXISTS ${TableNameConstant.tNotification} (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  taskId INTEGER,
  title TEXT,
  message TEXT,
  timestamp TEXT,
  taskType TEXT,
  isRead INTEGER DEFAULT 0
);
''';

}
