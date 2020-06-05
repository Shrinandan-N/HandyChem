import 'package:chem_search/elements.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:chem_search/chemicalResearchPage.dart';
import 'package:chem_search/molarMass.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'elements.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

void main() {

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {

  runApp(
      MaterialApp(
        theme: ThemeData(primaryColor: Colors.lightBlue,
            accentColor: Colors.lightBlueAccent),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ));
  });
}
class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() =>  _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(milliseconds: 1500),
        (){
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => MyApp()));
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope(
      onWillPop: () async => true,
      child: new Scaffold(
        body: new Center(
            child: Container(
              child: Center(
                child: Image.asset('assets/logo.png', scale: 2,)
              )
            )
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkModeEnabled = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  Widget callPage(int currentIndex){
    switch(currentIndex){
      case 0: return chemPage();
      case 1: return elementPage();
      case 2: return massPage();

        break;
      default: return elementPage();
    }
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      key: _scaffoldKey,

//      drawer: new Drawer(
//
//        child: ListView(
//
//        ),
//      ),
//      appBar: AppBar(
//        backgroundColor: Colors.lightBlue,
//          title: Text("ChemSearch", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
//          leading: new IconButton(icon: new Icon(Icons.settings, color: Colors.white,),
//              onPressed: () => _scaffoldKey.currentState.openDrawer())
//      ),
      body: callPage(_currentIndex),
//      bottomNavigationBar: new BottomNavigationBar(
//        currentIndex: _currentIndex,
//        onTap: (value){
//          _currentIndex = value;
//          setState(() {
//
//          });
//        },
//        items: [
//          BottomNavigationBarItem(
//              icon: Icon(Icons.search),
//              title: Text("Chemical Research")
//          ),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.grain),
//              title: Text("Molar Mass")
//          )
//        ],
//      ),
    bottomNavigationBar: CurvedNavigationBar(

      index: _currentIndex,
      height: MediaQuery.of(context).size.height  / 14,
      color: Colors.lightBlueAccent,
      buttonBackgroundColor: Colors.lightBlueAccent,
      backgroundColor: Colors.white70,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 400),
      items: [
          Icon(Icons.search, color: Colors.white,),
          Icon(Icons.language, color: Colors.white,),
          Icon(Icons.grain, color: Colors.white,),
        ],

      onTap: (value){
        _currentIndex = value;
        setState(() {

        });
      },
    ),

    );
    //body: tabs[_currentIndex],

  }

}



