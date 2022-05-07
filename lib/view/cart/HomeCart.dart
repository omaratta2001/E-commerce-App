import 'dart:developer';

import 'package:ecommerice/Widget/Navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swipe_to/swipe_to.dart';

import '../../Controller/Cart/SQLHelper.dart';
import '../../Controller/Cart/postdatasql.dart';
import '../../Widget/CheckOutTab.dart';
import '../../const.dart';

class HomeCart extends StatefulWidget {
  int Price = 0;

  @override
  State<HomeCart> createState() => _HomeCartState();

  HomeCart({
    required this.Price,
  });
}

class _HomeCartState extends State<HomeCart> {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      Consumer(
        builder: (BuildContext context,
            T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
          final viewmodel = watch(getdatasql);
          for (int i = 0; i < viewmodel.list.length; i++) {
            widget.Price += int.parse(viewmodel.list[i].price);
          }
          print(viewmodel.list.length);
          return Text("");
        },
      );
      print(widget.Price);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Consumer(
        builder: (context, watch, child) {
          final viewmodel = watch(getdatasql);

          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: viewmodel.list.length,
            itemBuilder: (BuildContext context, int index) {


              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwipeTo(
                  iconColor: Colors.black,
                  iconSize: 40,
                  iconOnLeftSwipe: Icons.delete,
                  onLeftSwipe: () {
                    PostData().deletedb(viewmodel.list[index].id).then((value) {
                      setState(() {
                        print(value);
                      });
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    child: Card(
                        color: Colors.white,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.network(
                                      viewmodel.list[index].image),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                            child: Container(
                                                child: Text(
                                          viewmodel.list[index].name,
                                          style: TextStyle(fontSize: 16),
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                        ))),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${viewmodel.list[index].price.toString()} EGP",
                                            style: TextStyle(
                                                color: Green, fontSize: 16),
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ))),
                  ),
                ),
              );
            },
          );
          /* if(viewmodel.list.isNotEmpty)
          {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: viewmodel.list.length,
              itemBuilder: (BuildContext context, int index) {
                print("length==========>");
                print(viewmodel.list.length);
                print(viewmodel.list[0].name);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwipeTo(
                    iconColor: Colors.black,
                    iconSize: 40,

                    iconOnLeftSwipe: Icons.delete,
                    onLeftSwipe: (){
                      Note().deletedb(viewmodel.list[index].id).then((value){
                        setState(() {
                          print("value$value");
                        });
                      });
                    },
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 5,
                      child: Card(
                          color: Colors.white,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child:
                                    Image.network(viewmodel.list[index].image),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Flexible(
                                              child: Container(
                                                  child: Text(
                                                    viewmodel.list[index].name,
                                                    style: TextStyle(
                                                        fontSize: 16),
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                    softWrap: false,
                                                  ))),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${viewmodel.list[index].price
                                                  .toString()} EGP",
                                              style: TextStyle(
                                                  color: Green, fontSize: 16),
                                              overflow: TextOverflow.fade,
                                              softWrap: false,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ))),
                    ),
                  ),
                );
              },
            );
          }
        else
          {
            return Center(child: CircularProgressIndicator());
          }*/
        },
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 16, color: Grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Consumer(
                    builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
                      final getTotal = watch(getdatasql);
                      return Text(
                        "${getTotal.price} EGP",
                        style: TextStyle(
                            color: Green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      );
                    },

                  )
                ],
              ),
              Container(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return CheckOutTab();
                      }));
                    },
                    child: Text(
                      "CHECKOUT",
                      style: TextStyle(fontSize: fontsubtitel),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Green,
                    ),
                  ))
            ],
          ),
        ),
      ),
      /*   floatingActionButton: Container(
        width: MediaQuery.of(context).size.width / 1.1,
    child: FloatingActionButton.extended(
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return CheckOutTab();
    }));
    },
    backgroundColor: Green,
    label: Text(
    "CHECKOUT",
    style: TextStyle(fontSize: fontsubtitel),
    ),
    icon: Icon(Icons.shopping_cart_sharp),
    ),
    ),*/
    );
  }
}
