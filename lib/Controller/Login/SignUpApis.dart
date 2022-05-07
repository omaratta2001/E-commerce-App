import 'dart:convert';
import 'package:ecommerice/const.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final postdataSignUp = ChangeNotifierProvider<SignUpApis>((ref) => SignUpApis(postData: (Email, Password, name, phone) {}));

class SignUpApis extends ChangeNotifier {
  String? Email;
  String? Password;
  String? Name;
  String? Phone;
  bool? tr1;

  Future postData(String email, String pass, String name, String phone) async {
    tr1 = false;

    try {
      var Url = Uri.parse("https://student.valuxapps.com/api/register");
      var respone = await http.post(Url, body: {
        "name": "$name",
        "phone": "$phone",
        "email": "$email",
        "password": "$pass",
      }, headers: {
        "lang": "en",
        "Connection": "keep-alive",
        "Accept-Encoding": "gzip, deflate, br"
      });
      var responseBody = jsonDecode(respone.body);
      if (responseBody["status"] == true) {
        print(responseBody["message"]);
        print(responseBody["data"]);
        print(tr1);
        tr1 = true;

        Fluttertoast.showToast(
            msg: responseBody["message"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Green,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else {
        print(responseBody["message"]);
        print(tr1);
        tr1 = false;
        Fluttertoast.showToast(
            msg: responseBody["message"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  SignUpApis({
    postData(Email, Password, Name, Phone)?,
  });
}
