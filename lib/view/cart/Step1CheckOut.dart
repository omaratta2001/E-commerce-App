import 'package:flutter/material.dart';

import '../../const.dart';

class Step1CheckOut extends StatefulWidget {
  const Step1CheckOut({Key? key}) : super(key: key);

  @override
  State<Step1CheckOut> createState() => _Step1CheckOutState();
}

class _Step1CheckOutState extends State<Step1CheckOut> {
  late int groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            title: Text('Standard Delivery', style: TextStyle(
                fontSize: fontLarge, fontWeight: FontWeight.bold),),

            trailing: new Radio(value: 1,
                groupValue: groupValue,
                onChanged: (int? e) => something (e),

              activeColor: Green,),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Order will be delivered between 3 - 5 business days",style: TextStyle(fontSize: fonttitel),),
            ),
          ),
          ListTile(
            title: Text('Next Day Delivery', style: TextStyle(
                fontSize: fontLarge, fontWeight: FontWeight.bold),),

            trailing: new Radio(value: 2,
              groupValue: groupValue,
              onChanged: (int? e) => something (e),

              activeColor: Green,),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Place your order before 6pm and your items will be delivered the next day",style: TextStyle(fontSize: fonttitel),),
            ),
          ),
          ListTile(
            title: Text('Nominated Delivery', style: TextStyle(
                fontSize: fontLarge, fontWeight: FontWeight.bold),),

            trailing: new Radio(value: 3,
              groupValue: groupValue,
              onChanged: (int? e) => something (e),

              activeColor: Green,),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Pick a particular date from the calendar and order will be delivered on selected date",style: TextStyle(fontSize: fonttitel),),
            ),
          )
        ],
      ),
    );
  }
  void something(int? e)
  {
    setState(() {
      if(e==1)
      {
        groupValue=1;
      }else if (e == 2)
      {
        groupValue=2;
      }
      else if (e == 3)
      {
        groupValue=3;
      }

    });
  }

}
