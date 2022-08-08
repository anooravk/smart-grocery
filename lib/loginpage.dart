import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:smartgrocery/main.dart';

import 'emailsignup.dart';
import 'userprofilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  bool showSpinner=false;
  String? email;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage(lightmode,gridView)));
      }
    }
  }

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
  String? password;
  @override
  Widget build(BuildContext context) {

    return ModalProgressHUD(

      inAsyncCall: showSpinner,
      child: MaterialApp(debugShowCheckedModeBanner: false,
        theme: lightmode?lightTheme:darkTheme,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children:[
            SizedBox(height: 70.0,),
       Container(child: Image.asset('assets/images/testnewlogo.png'), height: 250.0,
         width: double.infinity,),
            SizedBox(height: 70.0,),
         Text(
            'Shopping made easy!',
            style: TextStyle(
              color: Colors.green[200],
              fontWeight: FontWeight.w700,
              fontSize: 30.0,
              fontFamily: 'Montserrat',
            ),),
           SizedBox(height: 10.0,),
           Text(
             'keep track of your favourite items.',
             style: TextStyle(
               color: Colors.green[300],
               fontWeight: FontWeight.w700,
               fontSize: 30.0,
               fontFamily: 'BirthstoneBounce',
             ),
        ),
            SizedBox(height: 120.0,),
              LoginIcons(FontAwesomeIcons.google,'Continue with Google',30.0,() async{

                showSpinner = true;
                signup(context);
                setState((){});
                showSpinner = false;
              },),

              SizedBox(height: 10.0,),
              LoginIcons(Icons.email,'Continue with Email',35.0,() {
                showSpinner = true;
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailSignIn())) ;
                showSpinner = false;
              }),
          ],
        ),
      ),
      ),
    );
  }
}

class LoginIcons extends StatelessWidget {
  IconData icon;
  String label;
  double size;
  Function () onTap;
  LoginIcons(this.icon,this.label,this.size,this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 380.0,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: Colors.green[200],
          elevation: 3,
        ),
        icon: Padding(
          padding: const EdgeInsets.all(9.0),
          child: FaIcon(icon,size: size),
        ),
        onPressed: onTap,
        label: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
            fontFamily: 'Montserrat',
      ),),
            ),
    );
  }
}

