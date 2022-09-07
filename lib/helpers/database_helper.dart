import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database ? _database;
  Future<Database> get database async => _database ?? = await _initDatabase();

  Future<Database>_initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join (documentsDirectory.path, 'animals.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }
}