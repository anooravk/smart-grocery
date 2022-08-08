import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'userprofilepage.dart';
class GroceryListTiles extends StatelessWidget {
  GroceryListTiles({this.title,required this.onPressed});
  String? title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 10.0,
      minLeadingWidth: 10.0,
      contentPadding: EdgeInsets.all(20.0),
      leading: Text(
        title!,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22.0,
          fontFamily: 'Montserrat',
          color: lightmode?Colors.white:Colors.black,
        ),
      ),
      tileColor: Colors.green[200],
      trailing: Icon(
        Icons.arrow_forward,
        size: 30.0,
        color: lightmode?Colors.white:Colors.black,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: lightmode?Colors.white:Colors.black),
      ),
      onTap: onPressed,
    );
  }
}
