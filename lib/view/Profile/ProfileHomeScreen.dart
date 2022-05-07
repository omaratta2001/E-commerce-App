import 'package:ecommerice/Controller/Profile/ProfileApis.dart';
import 'package:ecommerice/Widget/ListTileWidget.dart';
import 'package:ecommerice/const.dart';
import 'package:ecommerice/view/Login/Login.dart';
import 'package:ecommerice/view/Profile/EditProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widget/Navigator.dart';

class ProfileHomeScreen extends StatefulWidget {
  @override
  State<ProfileHomeScreen> createState() => _ProfileHomeScreenState();
}

class _ProfileHomeScreenState extends State<ProfileHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer(
            builder: (context, watch, child) {
              final viewmodel = watch(profialdata);
              if(viewmodel.name != '')
                {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: Image.network(
                                  viewmodel.image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,

                                )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  viewmodel.name,
                                  style: TextStyle(
                                      fontSize: 26, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  viewmodel.email,
                                  style: TextStyle(fontSize: fontsubtitel),
                                )
                              ],
                            ),
                          ]),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                            return EditProfileScreen();
                          }));
                        },
                        child: ListTileWidget(
                          name: 'Edit Profile',
                          image: 'assests/icon/Icon_Edit.svg',
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: ListTileWidget(
                          name: 'Shipping Address',
                          image: 'assests/icon/Icon_Shipping.svg',
                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                        },
                        child: ListTileWidget(
                          name: 'Order History',
                          image: 'assests/icon/Icon_Oder_History.svg',
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: ListTileWidget(
                          name: 'Cards',
                          image: 'assests/icon/Icon_Card.svg',
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: ListTileWidget(
                          name: 'Notifications',
                          image: 'assests/icon/Icon_Notfifaction.svg',
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.remove('tokenn');
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                            return LoginScreen(Name: '', Password: '', Email: '',);
                          }));
                        },
                        child: ListTileWidget(
                          name: 'Log Out',
                          image: 'assests/icon/Icon_Exit.svg',
                        ),
                      ),
                    ],
                  );
                }
              else
                {
                  return Center(child: CircularProgressIndicator(),);
                }

            },
          ),
        ),
      ),
      /*bottomNavigationBar: Navigationbar(
        page: 2,
      ),*/
    );
  }
}
