import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerice/switchbetweenhome.dart';
import 'package:ecommerice/view/Home/HomeScreen.dart';
import 'package:ecommerice/view/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme:
              GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme),
        ),
        home: AnimatedSplashScreen(
          nextScreen: switchdd(),
          backgroundColor: Colors.black,
          duration: 4000,
          splash: Image.asset(
            'assests/images/Camera Image.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          splashIconSize: double.infinity,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.topToBottom,
        ));
  }
}
