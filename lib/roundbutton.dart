import 'package:flutter/material.dart';

class Rounded_Button extends StatelessWidget {
  Rounded_Button({this.title, @required this.onPressed, this.colour});
  final String? title;
  final Function()? onPressed;
  final Color? colour;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title!,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
              fontFamily: 'Montserrat',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
