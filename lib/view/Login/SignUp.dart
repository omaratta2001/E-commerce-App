import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Controller/Login/SignUpApis.dart';
import '../../const.dart';
import 'Login.dart';

class SignUp extends StatefulWidget {
  String Email;
  String Password;
  String Name;
  String Phone;

  @override
  State<SignUp> createState() => _SignUpState();

  SignUp({
    required this.Email,
    required this.Password,
    required this.Name,
    required this.Phone,
  });
}

class _SignUpState extends State<SignUp> {
  final bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Green, size: 40),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Consumer(
          builder: (context, watch, child) {
            final viewmodel = watch(postdataSignUp);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          maxLines: 1,
                          style: const TextStyle(fontSize: fontLarge),
                          decoration: const InputDecoration(
                            hintText: "Enter Name",
                            hintStyle: TextStyle(color: Grey),
                            labelStyle:
                                TextStyle(color: Grey, fontSize: fonttitel),
                            fillColor: Green,
                            labelText: "Name",
                            helperStyle: TextStyle(color: Green),
                            contentPadding: EdgeInsets.all(DPadding / 2),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Green),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Green),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Green, width: 0.5),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              widget.Name = val;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 30,
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
                              borderSide: BorderSide(color: Green, width: 0.5),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              widget.Email = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          maxLines: 1,
                          style: const TextStyle(fontSize: fontLarge),
                          decoration: const InputDecoration(
                            hintText: "Enter Phone",
                            hintStyle: TextStyle(color: Grey),
                            labelStyle:
                                TextStyle(color: Grey, fontSize: fonttitel),
                            fillColor: Green,
                            labelText: "Phone",
                            helperStyle: TextStyle(color: Green),
                            contentPadding: EdgeInsets.all(DPadding / 2),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Green),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Green),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Green, width: 0.5),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              widget.Phone = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 30,
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
                              borderSide: BorderSide(color: Green, width: 0.5),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              widget.Password = val;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              viewmodel
                                  .postData(widget.Email, widget.Password,
                                      widget.Name, widget.Phone)
                                  .then((value) {
                                if (viewmodel.tr1 == true) {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return LoginScreen(
                                      Name: '',
                                      Password: '',
                                      Email: '',
                                    );
                                  }));
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
              ),
            );
          },
        ),
      ),
    );
  }
}
