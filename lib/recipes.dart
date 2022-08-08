import 'package:flutter/material.dart';

import 'package:smartgrocery/cooking.dart';

import 'bottomappbar.dart';
import 'main.dart';
import 'userprofilepage.dart';
class Recipes extends StatefulWidget {
  const Recipes({Key? key}) : super(key: key);

  @override
  _RecipesState createState() => _RecipesState();
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
    bottomAppBarColor: Colors.black
);
class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: lightmode?lightTheme:darkTheme,
        home: Scaffold(
        bottomNavigationBar: buildRowForIcons(),
        ),);
  }

  Row buildRowForIcons() {
    return Row(
      children: [
        BottomNavIcon(
            lightmode,
            Icons.playlist_add_check, 0,
                (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(lightmode,gridView)));
            }
        ),
        BottomNavIcon(
           lightmode,
            Icons.book, 1,
                (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>JsonResponse()));
            }
        ),
        BottomNavIcon(
            lightmode,
            Icons.person, 2,
                (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfilePage(gridView)));
            }
        ),
      ],
    );
  }
}
