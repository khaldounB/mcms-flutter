part of 'database_configuration.dart';

Database? _$database;



Future<Database> _$GetDatabase() async{
  if(_$database == null){
    _$database = await _$Initialization();
    return _$database!;
  }
  return _$database!;
}

Future<Database> _$Initialization() async {
  final String databasePath = await getDatabasesPath();

  final String path = join(databasePath, 'one-delivery.db');

  _$database = await openDatabase(path, onCreate: _$OnCreate,version: 1);

  return _$database!;
}

Future<void> _$OnCreate(Database database, int version) async {
  await database.execute('''
    CREATE TABLE "products" (
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "product_id" INTEGER NOT NULL,
      "name" TEXT NOT NULL,
      "description" TEXT NOT NULL,
      "image" TEXT NOT NULL,
      "price" INTEGER NOT NULL,
      "quantity" INTEGER NOT NULL,
      "unit" TEXT NOT NULL,
      "note" TEXT NOT NULL,
      "is_product" INTEGER NOT NULL,
      "show_price" INTEGER NOT NULL
    )
    ''');
}


Future<List<Map<String, Object?>>> _$ReadData({required String query}) async{
  Database database = await _$GetDatabase();

  final Future<List<Map<String, Object?>>> response = database.rawQuery(query);

  return response;
}

Future<int> _$InsertData({required String query}) async{
  Database database = await _$GetDatabase();

  final Future<int> response = database.rawInsert(query);

  return response;
}

Future<int> _$UpdateData({required String query}) async{
  Database database = await _$GetDatabase();

  final Future<int> response = database.rawUpdate(query);

  return response;
}

Future<int> _$DeleteData({required String query}) async{
  Database database = await _$GetDatabase();

  final Future<int> response = database.rawDelete(query);

  return response;
}