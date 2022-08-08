import 'package:flutter/material.dart';

class BottomNavIcon extends StatefulWidget {
   BottomNavIcon(this.lightmode,this.icon,this.index,this.onPressed);
bool lightmode;
final IconData icon;
final int index;
final void Function() onPressed;
  @override
  _BottomNavIconState createState() => _BottomNavIconState();
}

class _BottomNavIconState extends State<BottomNavIcon> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = widget.index;
          });
        },
        child: Container(
          height: 70.0,
          width: MediaQuery.of(context).size.width / 3,
          color: widget.lightmode?Colors.white:Colors.black,
          child: IconButton(
            onPressed: widget.onPressed,
            icon: Icon(widget.icon,size: 35.0,),
            color: widget.index == selectedIndex ? Colors.green[300] : Colors.green[100],
          ),
        ),
      );
    }



  }

