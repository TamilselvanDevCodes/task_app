abstract class DatabaseModel {
  /// Convert model to a Map for database storage.
   Map<String, dynamic> toMap();

  /// Convert database Map back to model instance.
   DatabaseModel fromMap(Map<String, dynamic> map);

  /// Get the primary key (useful for update/delete operations).
  dynamic getId();
}
