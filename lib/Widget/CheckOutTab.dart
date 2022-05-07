import 'package:ecommerice/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabBar.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';

import '../view/cart/Step1CheckOut.dart';
import '../view/cart/Step2CheckOut.dart';
import '../view/cart/Step3CheckOut.dart';
class CheckOutTab extends StatefulWidget {


  @override
  State<CheckOutTab> createState() => _CheckOutTabState();


}

class _CheckOutTabState extends State<CheckOutTab> with SingleTickerProviderStateMixin {
  final tablist = ["Step 1","Step 2", "Step 3"];
  TabController? _tabController;
  @override
  void initState(){
    _tabController = TabController(length: tablist.length, vsync: this);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckOut",style: TextStyle(fontSize: 20),),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicator: PointTabIndicator(
            position: PointTabIndicatorPosition.bottom,
            color: Colors.white,
            insets: EdgeInsets.only(bottom: 6),
          ),
          tabs: tablist.map((item){
            return Tab(
              text: item,
            );
          }).toList()

        ),
        backgroundColor: Green,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
        iconTheme: IconThemeData(

            size: 40
        ),


      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Step1CheckOut(),
          Step2CheckOut(Street1: '', city: '', state: '', country: '', Street2: '',),
          Step3CheckOut(),
        ],),
    );
  }
}
