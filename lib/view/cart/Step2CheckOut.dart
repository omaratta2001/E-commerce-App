import 'package:ecommerice/Widget/CheckOutTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class Step2CheckOut extends StatefulWidget {
  String Street1;
  String Street2;
  String  city;
  String state;
  String  country;


  @override
  State<Step2CheckOut> createState() => _Step2CheckOutState();

  Step2CheckOut({
    required this.Street1,
    required this.Street2,
    required this.city,
    required this.state,
    required this.country,
  });
}

class _Step2CheckOutState extends State<Step2CheckOut> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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

                children: [
                  TextFormField(
                    maxLines: 1,
                    style: const TextStyle(fontSize: fontLarge),

                    decoration: const InputDecoration(
                      hintText: "Enter Street 1",
                      hintStyle: TextStyle(color: Grey),
                      labelStyle:
                      TextStyle(color: Grey, fontSize: fonttitel),
                      fillColor: Green,
                      labelText: "Street 1",
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
                        widget.Street1 = val;
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
                      hintText: "Enter Street 2",
                      hintStyle: TextStyle(color: Grey),
                      labelStyle:
                      TextStyle(color: Grey, fontSize: fonttitel),
                      fillColor: Green,
                      labelText: "Street 2",
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
                        widget.Street2 = val;
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
                      hintText: "Enter City",
                      hintStyle: TextStyle(color: Grey),
                      labelStyle:
                      TextStyle(color: Grey, fontSize: fonttitel),
                      fillColor: Green,
                      labelText: "City",
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
                        widget.city = val;
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
                      hintText: "Enter State",
                      hintStyle: TextStyle(color: Grey),
                      labelStyle:
                      TextStyle(color: Grey, fontSize: fonttitel),
                      fillColor: Green,
                      labelText: "State",
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
                        widget.state = val;
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
                      hintText: "Enter Country",
                      hintStyle: TextStyle(color: Grey),
                      labelStyle:
                      TextStyle(color: Grey, fontSize: fonttitel),
                      fillColor: Green,
                      labelText: "Country",
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
                        widget.country = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
              ElevatedButton(
                onPressed: (){

                },

                 child: Text("Next", style: TextStyle(
                  fontSize: fontsubtitel),),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(right: 50,left: 50,top: 20,bottom: 20),
                  primary: Green,

                ),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
