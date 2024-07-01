import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:real_estate/screen/favorite/model/db_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper._();

  DbHelper._();

  Database? database;
  final String DB_NAME = "data.db";

  Future<Database> checkDB() async {
    if (database != null) {
      return database!;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, DB_NAME);
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String queryRealTable =
            "CREATE TABLE real(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, image TEXT, email TEXT, mobile TEXT, rating TEXT, city TEXT, description TEXT, price TEXT)";
        db.execute(queryRealTable);
      },
    );
  }

  //insertQuotes
  Future<void> insertRealData(DbModel dbModel) async {
    database = await checkDB();
    database!.insert("real", {
      "id": dbModel.id,
      "name": dbModel.name,
      "image": dbModel.image,
      "email": dbModel.email,
      "mobile": dbModel.mobile,
      "rating": dbModel.rating,
      "city": dbModel.city,
      "description": dbModel.description,
      "price": dbModel.price
    });
  }

  //readQuotes
  Future<List<DbModel>> readRealData() async {
    database = await checkDB();
    String query = "SELECT * FROM real";
    List<Map> data = await database!.rawQuery(query, null);
    List<DbModel> modelList = data.map((e) => DbModel.mapToModel(e)).toList();
    return modelList;
  }

  //deleteQuotes
  Future<void> deleteRealData({required String id}) async {
    database = await checkDB();
    database!.delete("real", where: "id=?", whereArgs: [id]);
  }
}
