import 'dart:convert';

import 'package:ecommerice/Controller/Login/LoginApis.dart';
import 'package:ecommerice/model/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/Home.dart';

final getdatahome = ChangeNotifierProvider<HomeApis>((ref) => HomeApis());

class HomeApis extends ChangeNotifier {
  List<Home> listDataModel = [];
  List<login> lismodel = [];

  HomeApis() {
    GetData();
  }

  Future GetData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('tokenn');

    listDataModel = [];
    listDataModel.clear();
    try {
      var Url = Uri.parse("https://student.valuxapps.com/api/home");
      var respone = await http.get(Url, headers: {
        "Authorization": "$token",
        "lang": "en",
        "Content-Type": "application/json",
      });

      var responseBody = jsonDecode(respone.body)["data"]["products"];
      for (var i in responseBody) {
        Home x = Home(
            id: i["id"],
            price: i["price"],
            old_price: i["old_price"],
            discount: i["discount"],
            image: i["image"],
            name: i["name"],
            description: i["description"],
            images: i["images"],
            in_favorites: i["in_favorites"],
            in_cart: i["in_cart"]);
        listDataModel.add(x);
      }
      if (jsonDecode(respone.body)["status"] == true) {
        print("True");
      } else {
        print("mafesh data");
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
