part 'database_queries.p.dart';

class DatabaseQueries {
  static final DatabaseQueries _databaseQueries = DatabaseQueries._internal();

  factory DatabaseQueries() {
    return _databaseQueries;
  }

  DatabaseQueries._internal();
}
