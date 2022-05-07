import 'package:ecommerice/view/Home/HomeScreen.dart';
import 'package:ecommerice/view/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'Widget/Navigator.dart';

class switchdd extends StatefulWidget {
  @override
  State<switchdd> createState() => _switchddState();
}

class _switchddState extends State<switchdd> {
  var Token;

  switchid() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("tokenn") == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LoginScreen(Email: '', Password: '', Name: '')),
          (Route<dynamic> route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
              Navigationbar(page: 0,)),
              (Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    switchid();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
