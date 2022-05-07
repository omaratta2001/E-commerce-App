import 'dart:convert';

import 'package:ecommerice/model/Profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final profialdata = ChangeNotifierProvider<ProfileApis>((ref) => ProfileApis());

class ProfileApis extends ChangeNotifier {
  var name = '',id,email,image,phone;
  ProfileApis() {
    GetData();
  }

  Future GetData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('tokenn');


    try {
      var url = Uri.parse("https://student.valuxapps.com/api/profile");
      var response = await http.get(url, headers: {
        "Authorization":
            "$token",
        "lang": "en",
        "Content-Type": "application/json",
      });
      var responsebo = jsonDecode(response.body);
      var responseData = jsonDecode(response.body)["data"];
      if (responsebo["status"] == true) {
        //print("tmm1");
        //print(responseData);

        name = jsonDecode(response.body)["data"]["name"];
        id = jsonDecode(response.body)["data"]["id"];
        email = jsonDecode(response.body)["data"]["email"];
        phone = jsonDecode(response.body)["data"]["phone"];
        image = jsonDecode(response.body)["data"]["image"];
        print(name);
        print("tmm1");
      } else {
        print("false");
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
