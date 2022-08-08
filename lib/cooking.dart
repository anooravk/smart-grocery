import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'userprofilepage.dart';
import 'webview.dart';
class JsonResponse extends StatefulWidget {
  const JsonResponse({Key? key}) : super(key: key);

  @override
  _JsonResponseState createState() => _JsonResponseState();
}

class _JsonResponseState extends State<JsonResponse> {

  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  }
  Map? mapResponse;
  List? listOfMeals;
  Future fetchData() async{
    String alpha=generateRandomString(1);
    http.Response response=await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?f=$alpha'));
    if(response.statusCode==200){
      setState(() {
        mapResponse=jsonDecode(response.body);
        listOfMeals=mapResponse!['meals'];
      });
    }
  }
  @override
  void initState() {
    fetchData();
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: lightmode?lightTheme:darkTheme,
      home: Scaffold(
        appBar: AppBar(iconTheme: IconThemeData( color: Colors. green[200]),
          title: Text(
          'Recipes',style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 26.0,
          fontFamily: 'Montserrat',
          color: Colors.green[200],
        ),
          ),),
        body: mapResponse==null?Center(child: CircularProgressIndicator(color: Colors.green[200],)):SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Text('Find all your yummy recipies here!!',style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 26.0,
                fontFamily: 'Montserrat',
                color: Colors.green[200],
              ),),
              SizedBox(height: 20.0,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){

                return Container(

                  padding: EdgeInsets.all(10),
                  child: Card(
                    color:  Colors.green[200],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    child: InkWell(
                      onTap: () { String url=mapResponse!['meals'][index]['strSource'].toString();
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=> WebViewExample(url,lightmode)));
                        // _launchURL(url);
      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                            children: <Widget>[

                        SizedBox(height: 10.0,),
                        ClipRRect(
                    //     borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(8.0),
                    //     topRight: Radius.circular(8.0),
                    // ),
                    child: Image.network(
                          mapResponse!['meals'][index]['strMealThumb'],
                           width: 300,
                          height: 200,
                          fit:BoxFit.fill

                    ),
                  ),
                              Text(mapResponse!['meals'][index]['strMeal'],style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 22.0,
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                              ),),
                              SizedBox(height: 10.0,),
                              Text(mapResponse!['meals'][index]['strInstructions'],style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0,
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                              ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              SizedBox(height: 10.0,),
                          Text('See Recipie',style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                            color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),),

                ],),
                      ),),),);
              },
              itemCount: listOfMeals==null?0:listOfMeals!.length,)
            ],
          ),
        )

      ),
    );
  }
}

