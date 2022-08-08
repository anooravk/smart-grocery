import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:smartgrocery/main.dart';
import 'user_model.dart';
import 'userprofilepage.dart';
import 'listofselecteditems.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
class DbrefGrocery extends StatefulWidget {
  bool lightmode;
  DbrefGrocery(this.lightmode);

  @override
  _DbrefGroceryState createState() => _DbrefGroceryState();
}

class _DbrefGroceryState extends State<DbrefGrocery> {

  final databaseRef = FirebaseDatabase.instance.reference().child('users');
  final _auth = FirebaseAuth.instance;
  final dbref = FirebaseDatabase.instance.reference().child("users");
  String? imagepath;
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
    iconTheme: IconThemeData(color: Colors.green[200],
    ),
    bottomAppBarColor: Colors.black,
  );
  bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text(
        'Delete',
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.green[200],
          fontSize: 23.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Text(
        'Are you sure you want to delete your selected items?',
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
            Items.selectedItems.clear();
            UserModel user_model = await UserModel(
                uid: _auth.currentUser!.uid,
                lengthofitem: Items.selectedItems.length.toString(),
                email: _auth.currentUser!.email.toString(),
                pathlist: Items.selectedItems);
            dbref.child(_auth.currentUser!.uid).update(user_model.toJson());
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(widget.lightmode,gridView)));
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
      theme: widget.lightmode?lightTheme:darkTheme,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () async{
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                  barrierDismissible: false);
            }, icon: Icon(Icons.delete))
          ],
          iconTheme: IconThemeData(color: Colors.green[200]),
          title: Text(
            'Selected Grocery',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Montserrat',
                color: Colors.green[200]),
          ),
        ),
        body: ModalProgressHUD(
          color: Colors.green[200]!,
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 250.0,
                  // child: Image.asset('assets/logo.jpeg'),
                  child: Center(
                      child: Lottie.asset('assets/json/food1.json')),
                ),
                FirebaseAnimatedList(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  query: databaseRef,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    Map<dynamic, dynamic> x =
                    snapshot.value as Map<dynamic, dynamic>;
                    print(x);
                    int? items;
                    if(x['pathlist']?.isEmpty??true)
                      Text('nothing found');
                    else{
                      showSpinner=true;
                    return ListView.builder(
                        shrinkWrap: true,
                        physics:NeverScrollableScrollPhysics(),
                        itemCount:x['pathlist'].length,
                        itemBuilder: (BuildContext context, int index) {
                          SizedBox(
                            height: 10.0,
                          );
                          return Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: widget.lightmode?Colors.white:Colors.black,width: 3),
                              color: Colors.green[200],
                              borderRadius:BorderRadius.all(Radius.circular(15.0))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(x['pathlist'][index].toString()),
                            ),

                          );

                            }
                            );
                  };
                    return Center(child: Text(''));},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}