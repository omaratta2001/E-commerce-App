import 'package:ecommerice/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final ChangeData =
    ChangeNotifierProvider<ChangePasswordApis>((ref) => ChangePasswordApis(changedata: (Code, Password, Email) {

    },));

class ChangePasswordApis extends ChangeNotifier {
  String? Code;
  String? Password;
  String? Email;
  bool? tr1;

  ChangePasswordApis({
   changedata(Code,Password,Email)?
});

  Future changedata(String code, String pasword,String email) async {
    tr1 = false;
    try {
      var Url = Uri.parse("https://student.valuxapps.com/api/reset-password");
      var respone = await http.post(Url, body: {
        "email": "$email",
        "code": "$code",
        "password": "$pasword"
      }, headers: {
        "lang": "en"
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
}
