import 'package:ecommerice/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListTileWidget extends StatefulWidget {
  String name;
  String image;

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();

  ListTileWidget({
    required this.name,
    required this.image,
  });
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: SvgPicture.asset(
          widget.image,
          width: 30,
          height: 30,
        ),
        title: Text(
          widget.name,
          style: TextStyle(fontSize: fontLarge),
        ),
        trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,));
  }
}
