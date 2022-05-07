import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Controller/Home/HomeApis.dart';
import '../../const.dart';
import 'Product.dart';

class SellAllScreen extends StatefulWidget {


  @override
  State<SellAllScreen> createState() => _SellAllScreenState();


}

class _SellAllScreenState extends State<SellAllScreen> {
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
        title: Text("See All",style: const TextStyle(fontSize: 20,color: Green),textAlign: TextAlign.center,),
      ),
      body:  Column(
        children: [
          Expanded(
            child: Consumer(builder: (context, watch, child) {
              final orientation = MediaQuery.of(context).orientation;
              final viewmodel = watch(getdatahome);
              return GridView.builder(
                shrinkWrap: true,
                itemCount: viewmodel.listDataModel.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                        return Product(discount: viewmodel.listDataModel[index].discount, images: viewmodel.listDataModel[index].images, in_favorites: viewmodel.listDataModel[index].in_favorites, id: viewmodel.listDataModel[index].id, in_cart: viewmodel.listDataModel[index].in_cart, price: viewmodel.listDataModel[index].price, image: viewmodel.listDataModel[index].image, old_price: viewmodel.listDataModel[index].old_price, description: viewmodel.listDataModel[index].description, name: viewmodel.listDataModel[index].name,);
                      }));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                viewmodel.listDataModel[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              viewmodel.listDataModel[index].name,
                              style: TextStyle(fontSize: 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "${viewmodel.listDataModel[index].price} EGP",
                                style: TextStyle(fontSize: 16,color: Green),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                    (orientation == Orientation.portrait) ? 2 : 3),
              );
            }),
          ),
        ],
      )
    );
  }
}
