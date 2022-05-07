import 'package:ecommerice/Controller/Cart/SQLHelper.dart';
import 'package:ecommerice/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step3CheckOut extends StatefulWidget {
  const Step3CheckOut({Key? key}) : super(key: key);

  @override
  State<Step3CheckOut> createState() => _Step3CheckOutState();
}

class _Step3CheckOutState extends State<Step3CheckOut> {
  final _pageViewController = PageController();
  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        children: [
          Column(
            children: [
              Expanded(
                child: Consumer(
                  builder: (BuildContext context,
                      T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
                    final viewmodel = watch(getdatasql);
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewmodel.list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Card(
                                color: Colors.transparent,
                                elevation: 0.0,
                                child: Column(
                                  children: [
                                    Image.network(
                                      viewmodel.list[index].image,
                                      width: 200,
                                      height: 100,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      viewmodel.list[index].name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      softWrap: true,
                                    ),
                                    Text(
                                      "${viewmodel.list[index].price} EGP",
                                      style: TextStyle(color: Green, fontSize: 16),
                                    ),
                                  ],

                                ),
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
              Text("Shipping Address",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18 ),)
            ],
          ),
        ],

      ),
    );
  }
}
