import 'package:flutter/material.dart';
import 'package:smartgrocery/userprofilepage.dart';
import 'package:smartgrocery/registeremail.dart';
import 'loginemail.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class EmailSignIn extends StatelessWidget {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            children:[
              SizedBox(height: 70.0,),
              Container(child: Image.asset('assets/images/testnewlogo.png'), height: 250.0,
                width: double.infinity,),
              SizedBox(height: 70.0,),
              Text(
                'Shopping made easy!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                  fontFamily: 'Montserrat',
                  color: Colors.green[200],
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
              LoginIcons('Log In',30.0,(){
                showSpinner = true;
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginEmail(gridView))) ;
                showSpinner = false;
              }),

              SizedBox(height: 10.0,),
              LoginIcons('Register',35.0,(){
                showSpinner = true;
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterEmail())) ;
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

  String label;
  double size;
  Function () onTap;
  LoginIcons(this.label,this.size,this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 300.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: Colors.green[200],
          elevation: 3,
        ),

        onPressed: onTap,
        child:Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
            fontFamily: 'Montserrat',
            color: Colors.white
          ),),
      ),
    );
  }
}

