// ignore_for_file: file_names, unused_field
import 'package:info_card_app/models/category_model.dart';
import 'package:info_card_app/models/infocard_model.dart';
import 'package:info_card_app/random_id.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cards.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
    );
  }

  Future _onConfigure(Database database) async {
    await database.execute('PRAGMA foreign_keys = ON');
  }

  Future _onCreate(Database database, int version) async {
    await database.execute('''
        CREATE TABLE categoryCard (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT
        )
      ''');
    await database.execute('''
        CREATE TABLE infoCard (
          id INTEGER PRIMARY KEY,
          catId INTEGER,
          name TEXT,
          data TEXT,
          creatingTime TEXT,
          creatingDay TEXT,
          FOREIGN KEY(catId) REFERENCES categoryCard(id)
        )
      ''');
  }

  Future<List<Category>> getCategoryList() async {
    Database database = await instance.database;
    var categories = await database.query('categoryCard', orderBy: 'name');
    List<Category> categoryList = categories.isNotEmpty
        ? categories.map((e) => Category.fromMap(e)).toList()
        : [];
    return categoryList;
  }

  Future<List<InfoCardModel>> getInfoCardList(int? catId) async {
    Database database = await instance.database;
    var infoCards = await database.query('infoCard',
        orderBy: 'name', where: 'catId = ?', whereArgs: [catId]);
    List<InfoCardModel> infoCardList = infoCards.isNotEmpty
        ? infoCards.map((e) => InfoCardModel.fromMap(e)).toList()
        : [];
    return infoCardList;
  }

  Future<int> addCategoryCard(Category category) async {
    Database database = await instance.database;
    return await database.insert(
      'categoryCard',
      category.toMap(),
    );
  }

  Future<int> addInfoCard(InfoCardModel infoCard) async {
    Database database = await instance.database;
    return await database.insert(
      'infoCard',
      infoCard.toMap(),
    );
  }

  Future<int> removeCategoryCard(int id) async {
    Database database = await instance.database;
    return await database.delete(
      'categoryCard',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> removeInfoCard(int id) async {
    Database database = await instance.database;
    return await database.delete(
      'infoCard',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> uptadeCategoryCard(Category category) async {
    Database database = await instance.database;
    return await database.update(
      'categoryCard',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<int> uptadeInfoCard(String data, InfoCardModel infoCardModel) async {
    Database database = await instance.database;
    return await database.update(
      'infoCard',
      infoCardModel.toMap(),
      where: 'id = ?',
      whereArgs: [RandomId.currentInfoCardId], 
    );
  }
}
