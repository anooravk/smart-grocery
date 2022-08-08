import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartgrocery/userprofilepage.dart';
import 'package:smartgrocery/main.dart';
import 'cards.dart';
import 'listofselecteditems.dart';
import 'user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class BreadsCards extends StatefulWidget {
  bool lightmode;

  BreadsCards(this.lightmode);

  @override
  State<BreadsCards> createState() => _BreadsCardsState();
}

class _BreadsCardsState extends State<BreadsCards> {
  final _auth = FirebaseAuth.instance;

  final dbref = FirebaseDatabase.instance.reference().child("users");

  ThemeData lightTheme=ThemeData(
      brightness: Brightness.light,
      accentColor: Colors.green[200],
      primaryColor: Colors.white,
      appBarTheme:AppBarTheme(backgroundColor: Colors.white),
      iconTheme: IconThemeData(color: Colors.green[200])
  );

  ThemeData darkTheme=ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.green[200],
    primaryColor: Colors.black,
    appBarTheme:AppBarTheme(color: Colors.black),
    iconTheme: IconThemeData(color: Colors.green[200]),
    bottomAppBarColor: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title:
      Text(
        'Save',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 23.0,
          color: Colors.green[200],
          fontWeight: FontWeight.w600,
        ),
      ),
      content:
      Text(
        'Do you want to save your selected items?',
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.green[200],
            fontSize: 20.0,
            fontWeight: FontWeight.normal),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () async {
            Navigator.pop(context, 'yes');
            UserModel user_model = await UserModel(
                uid: _auth.currentUser!.uid,
                lengthofitem: Items.selectedItems.length.toString(),
                email: _auth.currentUser!.email.toString(),
                pathlist: Items.selectedItems);

            dbref.child(_auth.currentUser!.uid).set(user_model.toJson());
          },
          child:
          Text(
            'yes',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.green[200],
                fontSize: 20.0,
                fontWeight: FontWeight.normal),
          ),
        ),
        FlatButton(
          onPressed: () => Navigator.pop(context, 'no'),
          child:
          Text(
            'no',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.green[200],
                fontSize: 20.0,
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
      backgroundColor: widget.lightmode?Colors.white:Colors.black,
    );
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: widget.lightmode ? lightTheme : darkTheme,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                      barrierDismissible: false);
                },
                icon: Icon(Icons.save))
          ],
          iconTheme: IconThemeData(color: Colors.green[200]),
          title: Text(
            'Breads & Pastries',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 26.0,
              fontFamily: 'Montserrat',
              color: Colors.green[200],
            ),
          ),
        ),
        body: gridView?ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                HeaderCont('assets/images/breadandpastrieslogo.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SquareCont(
                      'assets/images/bagels.webp',
                      BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                      ),

                    ),
                    SquareCont(
                      'assets/images/baguette.webp',
                      BorderRadius.zero,

                    ),
                    SquareCont(
                      'assets/images/blaetterteig.webp',
                      BorderRadius.only(
                        topRight: Radius.circular(15.0),
                      ),

                    ),
                  ],
                ),
                SizedBox(
                  height: 6.0,
                ),
                SqContRow(
                    'assets/images/broetchen.webp',
                    'assets/images/brot.webp',
                    'assets/images/brot_geschnitten.webp'),
                SizedBox(
                  height: 6.0,
                ),
                SqContRow(
                    'assets/images/dinner_rolls.webp',
                    'assets/images/donuts.webp',
                    'assets/images/english_muffins.webp'),
                SizedBox(
                  height: 6.0,
                ),
                SqContRow('assets/images/fishbratlinge.webp',
                    'assets/images/muffins.webp', 'assets/images/gipfeli.webp'),
                SizedBox(
                  height: 6.0,
                ),
                SqContRow(
                  'assets/images/pancakes.webp',
                  'assets/images/pizzateig.webp',
                  'assets/images/raclette.webp',
                ),
                SizedBox(
                  height: 6.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SquareCont(
                      'assets/images/scones.webp',
                      BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                      ),

                    ),
                    SquareCont(
                      'assets/images/tortillas.webp',
                      BorderRadius.zero,

                    ),
                    SquareCont(
                      'assets/images/broetchen.webp',
                      BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                      ),

                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ],
        ):ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeaderCont('assets/images/fruitandvegelogo.png'),
                SquareCont('assets/images/bagels.webp',BorderRadius.circular(10),
                  ),
                SizedBox(height: 10,),
                SquareCont('assets/images/baguette.webp',BorderRadius.circular(10),
                  ),
                SizedBox(height: 10,),
                SquareCont('assets/images/blaetterteig.webp',BorderRadius.circular(10),
                  ),
                SizedBox(height: 10,),
                SquareCont('assets/images/broetchen.webp',BorderRadius.circular(10),
                 ),
                SizedBox(height: 10,),
                SquareCont('assets/images/brot.webp',BorderRadius.circular(10),
                 ),
                SizedBox(height: 10,),
                SquareCont('assets/images/brot_geschnitten.webp',BorderRadius.circular(10),
                  ),
                SizedBox(height: 10,),
                SquareCont('assets/images/dinner_rolls.webp',BorderRadius.circular(10),
                  ),
                SizedBox(height: 10,),
                SquareCont('assets/images/donuts.webp',BorderRadius.circular(10),
                 ),
                SizedBox(height: 10,),
                SquareCont('assets/images/english_muffins.webp',BorderRadius.circular(10),
                 ),
                SizedBox(height: 10,),
                SquareCont('assets/images/fishbratlinge.webp',BorderRadius.circular(10),
                  ),
                SizedBox(height: 10,),
                SquareCont('assets/images/muffins.webp',BorderRadius.circular(10),
                  ),
                SizedBox(height: 10,),
                SquareCont('assets/images/gipfeli.webp',BorderRadius.circular(10),
                  ),
                SizedBox(height: 10,),
                SquareCont('assets/images/pancakes.webp',BorderRadius.circular(10),
                 ),
                SizedBox(height: 10,),
                SquareCont('assets/images/pizzateig.webp',BorderRadius.circular(10),
                  ),
                SizedBox(height: 10,),
                SquareCont('assets/images/raclette.webp',BorderRadius.circular(10),
                  ),
                SizedBox(height: 10,),
                SquareCont('assets/images/scones.webp',BorderRadius.circular(10),
                  ),
                SizedBox(height: 10,),
                SquareCont('assets/images/tortillas.webp',BorderRadius.circular(10),
                  ),
                SizedBox(height: 10,),
                SquareCont('assets/images/broetchen.webp',BorderRadius.circular(10),
                ),

              ],
            )
          ],
        )
      ),
    );
  }
}
