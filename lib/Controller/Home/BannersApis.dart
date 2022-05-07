import 'dart:convert';

import 'package:ecommerice/model/Banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
final getdatabanner = ChangeNotifierProvider<BannersApis>((ref) => BannersApis());

class BannersApis extends ChangeNotifier
{
  List<banner> listDataModel = [];

  BannersApis() {
    GetData();
  }

  Future GetData() async {
    listDataModel = [];
    listDataModel.clear();
    try {
      var Url = Uri.parse("https://student.valuxapps.com/api/banners");
      var respone = await http.get(Url);

      var responseBody = jsonDecode(respone.body)["data"];
      for (var i in responseBody) {
        banner x = banner(id: i["id"], image: i["image"]);
        listDataModel.add(x);
      }
      if(jsonDecode(respone.body)["status"] == true)
      {
        print("True");
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}