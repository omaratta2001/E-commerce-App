import 'package:ecommerice/Controller/Cart/SQLHelper.dart';
import 'package:ecommerice/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Controller/Cart/postdatasql.dart';

class Product extends StatefulWidget {
  var id;
  var price;
  var old_price;
  var discount;
  var image;
  var name;
  var description;
  var images;
  var in_favorites;
  var in_cart;

  @override
  State<Product> createState() => _ProductState();

  Product({
    required this.id,
    required this.price,
    required this.old_price,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.in_favorites,
    required this.in_cart,
  });
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.stars_rounded,
                color: Green,
                size: 40,
              ),
            )
          ],
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Green,
                  size: 50,
                ),
              )),
          flexibleSpace: Container(
              decoration: BoxDecoration(
            //image in at the top in the bar
            image: DecorationImage(
                image: NetworkImage("${widget.image}"),
                //to make image full of app bar
                ),
          )),
        ),
      ),
      body: SafeArea(
        top: true,
        minimum: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                          onPressed: () {},
                          child: Container(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Size",
                                  style: TextStyle(
                                    fontSize: fonttitel,
                                  ),
                                ),
                                Text(
                                  "XL",
                                  style: TextStyle(
                                      fontSize: fonttitel,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          color: Colors.white,
                          elevation: 5,
                          focusColor: Colors.white,
                        ),
                        RaisedButton(
                          onPressed: () {},
                          child: Container(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Color:",
                                  style: TextStyle(
                                    fontSize: fonttitel,
                                  ),
                                ),
                                Text(
                                  "Green",
                                  style: TextStyle(
                                      fontSize: fonttitel,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          color: Colors.white,
                          elevation: 5,
                          focusColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Details",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontLarge),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      widget.description,
                      style: TextStyle(fontSize: fontLarge),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,
              right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "price",
                    style: TextStyle(fontSize: 16, color: Grey,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("${widget.price} EGP",style: TextStyle(color: Green,fontSize: 18,fontWeight: FontWeight.bold),)
                ],
              ),

              Container(
                width: 150,
                height: 50,
                child: Consumer(

                  builder: (context, watch,child) {
                    return ElevatedButton(onPressed: (){
                      PostData().insertdb({
                        'name': widget.name,
                        'image': widget.image,
                        'price': widget.price
                      }).then((value){
                        setState(() {
                          print(value);
                        });

                     });
                    }, child:Text("Add",style: TextStyle(fontSize: 14),) ,
                      style: ElevatedButton.styleFrom(

                        primary: Green,

                      ),);
                  },

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
