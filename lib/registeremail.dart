
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'userprofilepage.dart';
import 'package:firebase_database/firebase_database.dart';

import 'roundbutton.dart';
import 'main.dart';


import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class RegisterEmail extends StatefulWidget {

  @override
  State<RegisterEmail> createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  String? email;
  String? password;

  bool showSpinner = false;

  final _auth = FirebaseAuth.instance;
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

    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: lightmode?lightTheme:darkTheme,
      home: Scaffold(
          backgroundColor: Colors.white,
          body:  ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: Image.asset('assets/images/testnewlogo.png'), height: 250.0,
                    width: double.infinity,),
                  SizedBox(height: 70.0,),
                  TextField(  style:  TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration:InputDecoration(
                        filled: true,
                        fillColor: Colors.green[200],
                        hintText: 'Enter your email',hintStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[200]!, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[200]!, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    style:  TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                      textAlign: TextAlign.center,
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                    decoration:InputDecoration(
                      filled: true,
                      fillColor: Colors.green[200],
                      hintText: 'Enter your password',hintStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green[200]!, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green[200]!, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),),),
                  SizedBox(
                    height: 24.0,
                  ),
                  Rounded_Button(
                    onPressed: () async {
                      try {
                        setState(() {
                          showSpinner = true;
                        });
                        final newUser = await _auth.createUserWithEmailAndPassword(
                            email: email!, password: password!);

                        if (newUser != null) {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(lightmode,gridView)) );
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    title: 'Register',
                    colour: Colors.green[200],
                  )

                ],
              ),
    ),
      ),);
  }
}
