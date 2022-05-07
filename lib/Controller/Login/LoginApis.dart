import 'dart:convert';
import 'package:ecommerice/Controller/Home/HomeApis.dart';
import 'package:ecommerice/const.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/Home.dart';
import '../../model/Login.dart';
import '../../view/Login/SignUp.dart';
final postdata =ChangeNotifierProvider<LoginnApis>((ref)=>LoginnApis(postData: (Email, Password) {  }));


class LoginnApis extends ChangeNotifier{
   String? Email;
   String? Password;
   String? Name;
   bool? tr1;
   List<login> listDataModel = [];

 Future postData(String email, String pass) async{
   final prefs = await SharedPreferences.getInstance();

   tr1=false;
   listDataModel = [];
   listDataModel.clear();
    try
        {
          var Url = Uri.parse("https://student.valuxapps.com/api/login");
          var respone = await http.post(Url,
          body: {
            "email":"$email",
            "password":"$pass"
          },
            headers: {
            "lang":"en"
            }
          );
           var responseBody = jsonDecode(respone.body);
           var resonsedata = jsonDecode(respone.body)["data"];
          await prefs.setString('tokenn', '${resonsedata["token"]}');

          if(responseBody["status"]==true)
            {
              print(responseBody["message"]);
              print(responseBody["data"]);
              print("tmm");
              tr1=true;
              Fluttertoast.showToast(
                  msg: responseBody["message"],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
              for(var i in resonsedata){
                login x = login(email: i["email"], name: i["name"], password: i["password"], token: i["token"], tr: true);
                listDataModel.add(x);
              }
            }
             else
            {

              print(responseBody["message"]);
              Fluttertoast.showToast(
                  msg: responseBody["message"],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
              print("m4 tmm");
              tr1 = false;
            }

        }catch(e)
    {
      print(e);
    }
    notifyListeners();
  }

 LoginnApis({

     postData(Email, Password)?,
  });
}