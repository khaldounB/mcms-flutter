// Package imports:
// ignore_for_file: depend_on_referenced_packages

// Package imports:
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

part 'database_configuration.p.dart';

class ConfigurationDatabase {
  Future<Database> get database async => _$GetDatabase();
  Future<Database> initialization() async => _$Initialization();
  ConfigurationDatabase(){
    _$Initialization();
  }
  Future<List<Map<String, Object?>>> readData({required String query}) =>
      _$ReadData(query: query);

  Future<int> insertData({required String query}) => _$InsertData(query: query);

  Future<int> updateData({required String query}) => _$UpdateData(query: query);

  Future<int> deleteData({required String query}) => _$DeleteData(query: query);
}
