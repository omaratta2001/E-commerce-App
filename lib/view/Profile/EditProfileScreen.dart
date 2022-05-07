import 'package:flutter/material.dart';

import '../../const.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
        title: Text("Edit Profile",style: const TextStyle(fontSize: 20,color: Green,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
      ),

    );
  }
}
