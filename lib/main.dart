import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smartgrocery/breadandpastries.dart';
import 'package:smartgrocery/cooking.dart';
import 'package:smartgrocery/fruitsandveges.dart';
import 'package:smartgrocery/onboardingscreen.dart';
import 'grocerylisttiles.dart';
import 'bottomappbar.dart';
import 'userprofilepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'loginpage.dart';
import 'dataretrieved.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MediaQuery(data: new MediaQueryData(), child:MyApp()));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  AnimationController? _controller;
  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: (3)),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) =>Container(
        color: Colors.white,
        child: Lottie.asset(
          'assets/splash.json',
          controller: _controller,
          height: MediaQuery.of(context).size.height * 1,
          animate: true,
          onLoaded: (composition) {
            _controller!
              ..duration = composition.duration
              ..forward().whenComplete(() => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OnBoardingScreen()),
              ));
          },
        ),
      ),
    ),);
  }
}

class HomePage extends StatefulWidget {
bool lightmode;
bool gridView;
HomePage(this.lightmode,this.gridView);
  @override
  _HomePageState createState() => _HomePageState();
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
    iconTheme: IconThemeData(color: Colors.green[200],
    ),
    bottomAppBarColor: Colors.black,
);
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: widget.lightmode?lightTheme:darkTheme,
      home: Scaffold(
        bottomNavigationBar: buildRowForIcons(),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DbrefGrocery(widget.lightmode)));
                }, icon: Icon(Icons.favorite_border_rounded,color: Colors.green[200],)),
          ],
          // Color(0xFF00C0A3),
          title: Text(
            'Home',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.green[200],
              fontSize: 26.0,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [

                Container(
                  height: 250.0,
                  // child: Image.asset('assets/logo.jpeg'),
                  child: Center(child: Lottie.asset('assets/json/food1.json')),
                ),
                GroceryListTiles(title: 'Fruits & Vegetables',onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitCards()));
                },),
                GroceryListTiles(title: 'Bread & Pastries',onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BreadsCards(widget.lightmode)));
                },),
                GroceryListTiles(title: 'Milk & Cheese',onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitCards()));
                },),
                GroceryListTiles(title: 'Meat & Fish',onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitCards()));
                },),
                GroceryListTiles(title: 'Ingredients & Spices',onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitCards()));
                },),
                GroceryListTiles(title: 'Frozen & Convenience',onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitCards()));
                },),
                GroceryListTiles(title: 'Grain Product',onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitCards()));
                },),
                GroceryListTiles(title: 'Snacks & Sweets',onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitCards()));
                },),
                GroceryListTiles(title: 'Beverages',onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitCards()));
                },),
                GroceryListTiles(title: 'Household',onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitCards()));
                },),
                GroceryListTiles(title: 'Care & Health',onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitCards()));
                },),
                GroceryListTiles(title: 'Pet Supplies',onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitCards()));
                },),
                GroceryListTiles(title: 'Home & Garden',onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitCards()));
                },),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Row buildRowForIcons() {
    return Row(
      children: [
        BottomNavIcon(
          widget.lightmode,
            Icons.playlist_add_check, 0,
                (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(widget.lightmode,widget.gridView)));
            }
        ),
        BottomNavIcon(
            widget.lightmode,
            Icons.book, 1,
                (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>JsonResponse()));
            }
        ),
        BottomNavIcon(
            widget.lightmode,
            Icons.person, 2,
                (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfilePage(gridView)));
            }
        ),
      ],
    );
  }


}
