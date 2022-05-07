import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerice/const.dart';
import 'package:ecommerice/view/Home/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

import '../../Controller/Home/BannersApis.dart';
import '../../Controller/Home/HomeApis.dart';
import '../../Controller/Profile/ProfileApis.dart';
import '../../Widget/Navigator.dart';
import 'SeeAll.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          Consumer(builder: (context,watch,child) {
                            final viewmodelbanner = watch(getdatabanner);
                            return CarouselSlider.builder(
                                itemCount: viewmodelbanner.listDataModel.length,
                                itemBuilder: (context , itemIndex,PageViewIndex){
                                  return GridTile(child: Image.network(viewmodelbanner.listDataModel[itemIndex].image,
                                    fit: BoxFit.fill,
                                  ),

                                  );
                                },
                                options: CarouselOptions(
                                  autoPlay: true,
                                  aspectRatio: 1.5,
                                  enlargeCenterPage: true,
                                  reverse: true,
                                  height: MediaQuery.of(context).size.height/4,
                                  autoPlayInterval: Duration(seconds: 5),
                                  autoPlayAnimationDuration: Duration(milliseconds: 500),
                                  scrollDirection: Axis.horizontal,
                                  initialPage: 0,
                                  viewportFraction: 0.7,
                                  enableInfiniteScroll: false,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                ));
                          },),
                          Align(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Categories",
                              style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: fontXLarge),
                            ),
                          ),
                          SizedBox(
                            height: 106,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Card(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: SvgPicture.asset(
                                          "assests/icon/Icon_Mens Shoe.svg",
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(30),
                                          primary: Colors.white,
                                          elevation: 5,
                                          shadowColor: Grey,
                                          onPrimary: Green,
                                        ),
                                      ),
                                      Text(
                                        "Mens",
                                        style: TextStyle(fontSize: fonttitel),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: SvgPicture.asset(
                                          "assests/icon/Icon_Womens Shoe.svg",
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(25),
                                          primary: Colors.white,
                                          elevation: 5,
                                          shadowColor: Colors.white,
                                          onPrimary: Green,
                                        ),
                                      ),
                                      Text(
                                        "Women",
                                        style: TextStyle(fontSize: fonttitel),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child:
                                        SvgPicture.asset("assests/icon/Icon_Devices.svg"),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(27),
                                          primary: Colors.white,
                                          elevation: 5,
                                          shadowColor: Colors.white,
                                          onPrimary: Green,
                                        ),
                                      ),
                                      Text(
                                        "Devices",
                                        style: TextStyle(fontSize: fonttitel),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child:
                                        SvgPicture.asset("assests/icon/Icon_Gadgets.svg"),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(25),
                                          primary: Colors.white,
                                          elevation: 5,
                                          shadowColor: Colors.white,
                                          onPrimary: Green,
                                        ),
                                      ),
                                      Text(
                                        "Gadgets",
                                        style: TextStyle(fontSize: fonttitel),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child:
                                        SvgPicture.asset("assests/icon/Icon_Gaming.svg"),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(25),
                                          primary: Colors.white,
                                          elevation: 5,
                                          shadowColor: Colors.white,
                                          onPrimary: Green,
                                        ),
                                      ),
                                      Text(
                                        "Gaming",
                                        style: TextStyle(fontSize: fonttitel),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Best Selling",
                                  style: TextStyle(
                                      fontSize: fontLarge, fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                      return SellAllScreen();
                                    }));
                                  },
                                  child: Text(
                                    "See all",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  

                  Expanded(child: Consumer(builder: (context, watch, child) {
                    final orientation = MediaQuery.of(context).orientation;
                    final viewmodel = watch(getdatahome);
                    print(viewmodel.listDataModel);
                    if(viewmodel.listDataModel.isNotEmpty)
                      {
                        return GridView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                  return Product(images: viewmodel.listDataModel[index].images, discount: viewmodel.listDataModel[index].discount, in_favorites: viewmodel.listDataModel[index].in_favorites, id: viewmodel.listDataModel[index].id, in_cart: viewmodel.listDataModel[index].in_cart, old_price: viewmodel.listDataModel[index].old_price, image: viewmodel.listDataModel[index].image, price: viewmodel.listDataModel[index].price, name: viewmodel.listDataModel[index].name, description: viewmodel.listDataModel[index].description,);
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
                                          " ${viewmodel.listDataModel[index].price} EGP",
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
                      }
                    else
                      {
                        return Center(child: CircularProgressIndicator());
                      }
                  }))
                ],
              ),
            ),
          ),

        ],
      ),
     // bottomNavigationBar: Navigationbar(page: 0,),
    );
  }
}
