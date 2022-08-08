import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:smartgrocery/loginpage.dart';
import 'package:lottie/lottie.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: IntroductionScreen(
      pages:[
        PageViewModel(
            decoration: getPageDecoration(),
          image: buildLottieImage('assets/otherselect.json'),
          title: 'Grocery shopping made easy!',
          body: "Tired of keeping track of all the items you need? Not anymore with smartgrocery!"
        ),
        PageViewModel(
            decoration: getPageDecoration(),
            image: buildLottieImage('assets/ingredients.json'),
            title: 'Many different options to choose from!',
            body: "Select from hunderds of different options!"
        ),
        PageViewModel(
            decoration: getPageDecoration(),
            image: buildLottieImage('assets/cooking.json'),
            title: 'Find all your delicious recipes here',
            body: "Explore thousands of different recipes to cook from!"
        ),
        PageViewModel(
            decoration: getPageDecoration(),
            image: buildLottieImage('assets/spread.json'),
            title: 'Share with your friends!',
            body: "Help out your friends by sharing it with who needs it!"
        ),
      ],
      done:Text('Done',style: TextStyle(fontFamily: 'Montserrat',fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.green[200]),),
    onDone:()=> goToHome(context),
      showSkipButton: true,
   dotsDecorator: getDotsDecoration(),
      skip: Text('Skip',style: TextStyle(fontFamily: 'Montserrat',fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.green[200]),),
      next: Icon(Icons.arrow_forward_ios_outlined,color: Colors.green[200],),
    ));
  }
}

Widget buildLottieImage(String path){
  return Center(child: Lottie.asset(path,width: 550,height: 700,),);
}

DotsDecorator getDotsDecoration(){
  return DotsDecorator(
    activeColor: Colors.green[200]!,
  );
}
void goToHome(context){
  Navigator.of(context).pushReplacement(
  MaterialPageRoute(builder: (_)=>LoginPage()),
);}
PageDecoration getPageDecoration(){
  return PageDecoration(
    titleTextStyle: TextStyle(fontFamily: 'Montserrat',fontSize: 26.0,fontWeight: FontWeight.w700,color: Colors.green[200]),
    bodyTextStyle: TextStyle(fontFamily: 'Montserrat',fontSize: 23.0,fontWeight: FontWeight.normal,color: Colors.green[200]),
    descriptionPadding: EdgeInsets.all(16.0).copyWith(bottom: 0),
    imagePadding: EdgeInsets.all(24.0),
    pageColor: Colors.white
  );
}