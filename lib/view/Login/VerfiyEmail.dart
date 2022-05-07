import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Controller/Login/VerfiyEmail.dart';

import '../../const.dart';
import 'ChangePassword.dart';
class ForgetPassword extends StatefulWidget {
  String Email;
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();

  ForgetPassword({
    required this.Email,
  });
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Green,
          size: 40
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 30,
          bottom: 30,
        ),
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
            child: Consumer(builder: (context,watch,child) {
              final viewmodel = watch(VerfyData);
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Forgot Password",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),

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
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        viewmodel.verfyemail(widget.Email).then((value) => {
                          if(viewmodel.tr1 == true)
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                return ChangePassword(Email: widget.Email, Code: '', Password: '',);
                              }))
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
              );
            },)
          ),
        ),
      ),
    );
  }
}
