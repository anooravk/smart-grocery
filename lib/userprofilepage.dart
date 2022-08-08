
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'bottomappbar.dart';
import 'loginpage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'cooking.dart';

class UserProfilePage extends StatefulWidget {
  bool gridView;

  UserProfilePage(this.gridView);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.green[200],
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    iconTheme: IconThemeData(color: Colors.green[200]));
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  accentColor: Colors.green[200],
  primaryColor: Colors.black,
  appBarTheme: AppBarTheme(color: Colors.black),
  iconTheme: IconThemeData(color: Colors.green[200]),
  bottomAppBarColor: Colors.black,
);
bool lightmode = true;
bool gridView=true;
class _UserProfilePageState extends State<UserProfilePage> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    return SafeArea(
      child: MaterialApp(debugShowCheckedModeBanner: false,
        theme: lightmode ? lightTheme : darkTheme,
        home: Scaffold(
          bottomNavigationBar: buildRowForIcons(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  Profile',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                    color: Colors.green[200],
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green[200],
                ),
                constraints: BoxConstraints(maxHeight: 350.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.settings_rounded,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    Divider(
                      color: Colors.green[200],
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 80.0,
                              width: 150.0,
                              decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.all(10.0),
                              child: Icon(Icons.view_module_outlined,
                                    size: 35.0, color: Colors.white),
                            ),
                            Text(
                              'List appearance',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            Switch(
                                activeColor: Colors.white,
                                inactiveThumbColor:Colors.grey ,
                                value: gridView,
                                onChanged: (state) {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                HomePage(lightmode, gridView)));
                                    gridView = state;
                                  });
                                })
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              height: 80.0,
                              width: 150.0,
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.all(10.0),
                              child: Icon(Icons.palette,
                                  size: 35.0, color: Colors.white),
                            ),
                            Text(
                              'Theme',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            Switch(
                              activeColor: Colors.white,
                                inactiveThumbColor:Colors.grey ,
                                value: lightmode,
                                onChanged: (state) {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                HomePage(lightmode, gridView)));
                                    lightmode = state;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.list_sharp,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'List Settings',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                              color: Colors.white,
                              fontFamily: 'Montserrat'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '  More Settings',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Colors.white,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.green[200]),
                constraints: BoxConstraints(maxHeight: 120.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.logout,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    Divider(
                      color: Colors.green[200],
                      thickness: 1,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await _googleSignIn.signOut();
                        setState(() {});
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildRowForIcons() {
    return Row(
      children: [
        BottomNavIcon(lightmode, Icons.playlist_add_check, 0, () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(lightmode, gridView)));
        }),
        BottomNavIcon(lightmode, Icons.book, 1, () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => JsonResponse()));
        }),
        BottomNavIcon(lightmode, Icons.person, 2, () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserProfilePage(gridView)));
        }),
      ],
    );
  }
}
