import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'listofselecteditems.dart';

bool isSelected= false;
Container HeaderCont(String imagePath) {
  return Container(
    height: 250.0,
    width: double.infinity,
    child: Image.asset(imagePath),
  );
}
class SquareCont extends StatefulWidget {
  final _auth = FirebaseAuth.instance;
  final dbref=FirebaseDatabase.instance.reference().child("users");
  void read(){
    dbref.once().then(( event){
      final dataSnapshot=event.snapshot;
       print(dataSnapshot.value);
    });
  }
SquareCont( this.imagePath, this.border) ;
String imagePath;
String? selected;
BorderRadius border;
Color? colour=Colors.green[200];
  @override
  _SquareContState createState() => _SquareContState();
}

class _SquareContState extends State<SquareCont> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: ()  {
        setState(()  {
          widget.colour = Colors.red[200] ;
          widget.selected=widget.imagePath;
          if(widget.selected==null){
           Items.selectedItems.add('nothing found');
          }else{
          Items.selectedItems.add(widget.imagePath);
          print(Items.selectedItems);}

        });
      },
      onDoubleTap: (){
        setState(() {
          widget.colour = Colors.green[200] ;
          Items.selectedItems.remove(widget.imagePath);
        });
      },
      child: Container(
        height: 100.0,
        width: 130.0,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: widget.colour,
            borderRadius: widget.border
        ),
        child: Image.asset(widget.imagePath),
      ),

    );
  }
}
Row SqContRow(String image1, image2, image3) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SquareCont(image1, BorderRadius.zero, ),
      SquareCont(image2, BorderRadius.zero,),
      SquareCont(image3, BorderRadius.zero,),
    ],
  );
}
