import 'dart:async';
import 'package:ecommerice/model/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getdatasql = ChangeNotifierProvider<Note>(
    (ref) => Note());

class Note extends ChangeNotifier {
  var result;
  int? Id;
  static Database? _db;
  List<Home> list = [];
  Map<String, dynamic>? Data;
  int price=0;
  Note()
  {
    price;
    getdb();
  }

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  initialDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "ecommerce5.db");
    var mydb = await openDatabase(path, version: 20, onCreate: _onCreate);
    return mydb;
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE ecommerce5(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,name TEXT NOT NULL,image TEXT NOT NULL,price TEXT NOT NULL )');
  }

  Future insertdb(Map<String, dynamic> data) async {
    try {
      Database? db_Clint = await db;

      var result = await db_Clint!.insert("ecommerce5", data);
      return result;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future deletedb(int id) async {
    try {
      Database? db_Clint = await db;
      result =
          await db_Clint!.rawUpdate('DELETE FROM ecommerce5 WHERE id="$id"');
      return result;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  /*Future<int>updatetodo(String description,int id)async{
    Database? db_Clint = await db;
    var result =await db_Clint!.rawUpdate('UPDATE todo1 SET description="$description" WHERE id="$id"');
    return result;
  }*/
  Future getdb() async {
    try {
      Database? db_Clint = await db;
      var result = await db_Clint!.query('ecommerce5');
      for (var i in result) {
        list.add(Home(
            id: i["id"],
            price: i["price"],
            old_price: i["old_price"],
            discount: i["discount"],
            image: i["image"],
            name: i["name"],
            description: i["description"],
            images: i["images"],
            in_favorites: i["in_favorites"],
            in_cart: i["in_cart"]));
        print(i["name"]);
      }
    } catch (e) {
      print(e);
    }
    for(int i=0;i<list.length;i++)
      {
        price +=int.parse(list[i].price);
      }
    notifyListeners();
  }

  Future<List> getSinglerowdb(int id) async {
    Database? db_Clint = await db;

    var result = await db_Clint!.query('ecommerce5', where: 'id' "$id");

    return result;
  }
}
