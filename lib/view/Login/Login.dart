import 'package:ecommerice/view/Home/HomeScreen.dart';
import 'package:ecommerice/view/Login/SignUp.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Controller/Login/LoginApis.dart';
import '../../const.dart';
import 'VerfiyEmail.dart';

class LoginScreen extends StatefulWidget {
  String Email;
  String Password;
  String Name;

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  LoginScreen({
    required this.Email,
    required this.Password,
    required this.Name,
  });
}

class _LoginScreenState extends State<LoginScreen> {
  final bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer(builder: (context, watch, child) {
                final viewmodel = watch(postdata);
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Grey,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 6.0)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Welcome,",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, CupertinoPageRoute(
                                      builder: (BuildContext context) {
                                    return SignUp(
                                      Phone: '',
                                      Password: '',
                                      Email: '',
                                      Name: '',
                                    );
                                  }));
                                },
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontSize: fontLarge, color: Green),
                                ),
                              )
                            ],
                          ),
                          const Text(
                            "Sign in to Continue",
                            style: TextStyle(fontSize: fonttitel, color: Grey),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            maxLines: 1,
                            style: const TextStyle(fontSize: fontLarge),
                            decoration: const InputDecoration(
                              hintText: "Enter Email",
                              hintStyle: TextStyle(color: Grey),
                              labelStyle:
                                  TextStyle(color: Grey, fontSize: fonttitel),
                              fillColor: Green,
                              labelText: "Email",
                              helperStyle: TextStyle(color: Green),
                              contentPadding: EdgeInsets.all(DPadding / 2),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Green),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Green),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Green, width: 0.5),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {
                                widget.Email = val;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            maxLines: 1,
                            style: const TextStyle(fontSize: fontLarge),
                            obscureText: _isObscure,
                            decoration: const InputDecoration(
                              hintText: "Enter Password",
                              hintStyle: TextStyle(color: Grey),
                              labelStyle:
                                  TextStyle(color: Grey, fontSize: fonttitel),
                              fillColor: Green,
                              labelText: "Password",
                              helperStyle: TextStyle(color: Green),
                              contentPadding: EdgeInsets.all(DPadding / 2),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Green),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Green),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Green, width: 0.5),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {
                                widget.Password = val;
                              });
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return ForgetPassword(
                                  Email: '',
                                );
                              }));
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      fontSize: fonttitel, color: Grey),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                viewmodel
                                    .postData(widget.Email, widget.Password)
                                    .then((value) {
                                  if (viewmodel.tr1 == true) {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return Navigator();
                                    }
                                    ),
                                    );

                                  }
                                });
                              },
                              child: const Text(
                                "SIGN IN",
                                style: TextStyle(fontSize: fonttitel),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Green),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
              const Text(
                "-OR-",
                style: TextStyle(fontSize: fontLarge),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FlatButton.icon(
                    onPressed: () {},
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    icon: SvgPicture.asset(
                      "assests/icon/Icon_Facebook.svg",
                      width: 20,
                    ),
                    label: const Text(
                      "Sign In with Facebook",
                      style: TextStyle(fontSize: fonttitel),
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FlatButton.icon(
                    onPressed: () {},
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    icon: SvgPicture.asset(
                      "assests/icon/icons8_Google_2.svg",
                      width: 20,
                    ),
                    label: const Text(
                      "Sign In with Google",
                      style: TextStyle(fontSize: fonttitel),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
