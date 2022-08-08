import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'userprofilepage.dart';
import 'package:smartgrocery/listofselecteditems.dart';

import 'cards.dart';
import 'user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FruitCards extends StatefulWidget {
  FruitCards({Key? key}) : super(key: key);

  @override
  State<FruitCards> createState() => _FruitCardsState();
}

class _FruitCardsState extends State<FruitCards> {
  final _auth = FirebaseAuth.instance;
  final dbref = FirebaseDatabase.instance.reference().child("users");
  ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      accentColor: Colors.green[200],
      primaryColor: Colors.white,
      appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      iconTheme: IconThemeData(color: Colors.green[200])
  );
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.green[200],
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(color: Colors.black),
    iconTheme: IconThemeData(color: Colors.green[200]),
    bottomAppBarColor: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text(
        'Save',
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.green[200],
          fontSize: 23.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Text(
        'Do you want to save your selected items?',
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20.0,
            color: Colors.green[200],
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
          child: Text(
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
          child: Text(
            'no',
            style: TextStyle(
                color: Colors.green[200],
                fontFamily: 'Montserrat',
                fontSize: 20.0,
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
      backgroundColor: lightmode ? Colors.white : Colors.black,
    );
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: lightmode ? lightTheme : darkTheme,
      home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () async {
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
              'Fruits & Vegetables',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 26.0,
                fontFamily: 'Montserrat',
                color: Colors.green[200],
              ),
            ),
          ),
          body: gridView ? ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Column(
                children: [
                  HeaderCont('assets/images/fruitandvegelogo.png'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SquareCont(
                        'assets/images/aprikosen.webp',
                        BorderRadius.only(
                          topLeft: Radius.circular(15.0),

                        ),

                      ),
                      SquareCont(
                        'assets/images/ananas.webp',
                        BorderRadius.zero,

                      ),
                      SquareCont(
                        'assets/images/aepfel.webp',
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
                      'assets/images/fruechte.webp',
                      'assets/images/fruehlingszwiebeln.webp',
                      'assets/images/ganja.webp'),
                  SizedBox(
                    height: 6.0,
                  ),
                  SqContRow('assets/images/avocado.webp',
                      'assets/images/bananen.webp',
                      'assets/images/aubergine.webp'),
                  SizedBox(
                    height: 6.0,
                  ),
                  SqContRow('assets/images/basilikum.webp',
                      'assets/images/baumnuesse.webp',
                      'assets/images/beeren.webp'),
                  SizedBox(
                    height: 6.0,
                  ),
                  SqContRow('assets/images/birnen.webp',
                    'assets/images/blumen.webp',
                    'assets/images/blumenkohl.webp',),
                  SizedBox(
                    height: 6.0,
                  ),
                  SqContRow(
                    'assets/images/champignons.webp',
                    'assets/images/cherrytomaten.webp',
                    'assets/images/getrocknete_tomaten.webp',),
                  SizedBox(
                    height: 6.0,
                  ),
                  SqContRow('assets/images/datteln.webp',
                    'assets/images/erdbeeren.webp',
                    'assets/images/fenchel.webp',),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SquareCont(
                        'assets/images/bohnen.webp',
                        BorderRadius.only(
                          bottomLeft: Radius.circular(15.0),
                        ),

                      ),
                      SquareCont(
                        'assets/images/brokkoli.webp',
                        BorderRadius.zero,

                      ),
                      SquareCont(
                        'assets/images/brombeeren.webp',
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
          ) : ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeaderCont('assets/images/fruitandvegelogo.png'),
                  SquareCont('assets/images/aprikosen.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/ananas.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/aepfel.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/fruechte.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/fruehlingszwiebeln.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/ganja.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/avocado.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/bananen.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/baumnuesse.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/beeren.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/basilikum.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/birnen.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/blumen.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/blumenkohl.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/champignons.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/cherrytomaten.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/getrocknete_tomaten.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/datteln.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/erdbeeren.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/fenchel.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/bohnen.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/brokkoli.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                  SquareCont('assets/images/brombeeren.webp',BorderRadius.circular(10),),SizedBox(height: 10,),
                ],
              )
            ],
          )
      ),
    );
  }
}