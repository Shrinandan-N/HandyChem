import 'dart:io';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'massResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class massPage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {

    return new molarMass();
  }
}



class molarMass extends State<massPage> {

  final mmController = TextEditingController();
  final tfController = TextEditingController();
  String mmText = "0.0";
  var currMolarMass = 0.0;
  Map<String, double> dataMap = Map();

  Future<void> _launched;
  String _formulaUrl = "https://apcentral.collegeboard.org/pdf/chemistry-equations-sheet-2020.pdf";
  String _solubilityUrl = "https://msu.edu/~howardb3/SolubilityRules-2.pdf";
  String _abUrl = "https://www.trentu.ca/online-legacy/modules/Chem/additionalresources/Strong_Acids_and_Bases.pdf";
  String _metricUrl = "https://www.troy.k12.oh.us/userfiles/1299/Classes/10651/metric%20prefixes.pdf";

  Future<void> _launchInApp(String url) async {
    if(await canLaunch(url)){
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if(!nativeAppLaunchSucceeded){
        await launch(url, forceSafariVC: true);
      }
    }
  }

  Future<Null> fetchMass(String formula) async{
    final response = await http.get('https://www.caymanchem.com/nemo/json/MolarMassPercentComposition?formula=${formula}');
    if(response.statusCode == 200){
      String molarMass =  massResponse.fromJson(json.decode(response.body)).formulaMolarMass.toString();
      double massMolar = double.parse(massResponse.fromJson(json.decode(response.body)).formulaMolarMass);

      setState(() {
        currMolarMass = massMolar;
        mmText = molarMass;
      });

    } else{
      throw Exception('Failed to load molar mass');
    }
  }


  Future<massResponse> futureMassResponse;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async => false,
      child:  Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Chemistry Resources"),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 1.5,
        ),

      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              new Column(
                children: <Widget>[
                  new Text("Molar Mass Calculator", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),),
                  new Padding(padding: EdgeInsets.all(2.0)),
                  new TextField(
                    decoration: new InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search, color: Colors.lightBlueAccent,),
                        onPressed: (){
                          fetchMass(mmController.text);

                        },),

                      contentPadding: EdgeInsets.all(5.0),
                      hintText: "Ex: H2O",
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 5.0
                        ),
                      ),
                    ),
                    textCapitalization: TextCapitalization.characters,
                    controller: mmController,
                    onSubmitted: (txtVal){
                      fetchMass(txtVal);
                    },

                  ),
                  new Padding(padding: EdgeInsets.all(5.0)),
                  Card(
                    color: Colors.lightBlueAccent,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: new FlatButton(

                            child: Text("Calculate Molar Mass"),
                            onPressed: (){
                              fetchMass(mmController.text);
                            },
                          ),
                        ),

                        Card(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(5)),
                                Text(mmText, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                                Text("g/mol", style: TextStyle(fontSize: 20),),
                                Padding(padding: EdgeInsets.all(5)),
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              ),

              new Padding(padding: EdgeInsets.all(15.0),),
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Text("Reference Sheets", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),),

                  new SizedBox(
                    width: double.infinity,
                    child: new OutlineButton(
                        child: Text("Chemistry Formulas", style: TextStyle(color: Colors.black),),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            style: BorderStyle.solid
                        ),
                        onPressed: (){
                          _launchInApp(_formulaUrl);
                        }
                    ),
                  ),

                  new SizedBox(
                    width: double.infinity,
                    child: new OutlineButton(
                        child: Text("Solubility", style: TextStyle(color: Colors.black)),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            style: BorderStyle.solid
                        ),
                        onPressed: (){
                          _launchInApp(_solubilityUrl );
                        }
                    ),
                  ),
                  new SizedBox(
                    width: double.infinity,
                    child: new OutlineButton(
                        child: Text("Strong Acids and Bases", style: TextStyle(color: Colors.black)),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            style: BorderStyle.solid
                        ),
                        onPressed: (){
                          _launchInApp(_abUrl);
                        }
                    ),
                  ),
                  new SizedBox(
                    width: double.infinity,
                    child: new OutlineButton(
                        child: Text("Metric prefixes", style: TextStyle(color: Colors.black),),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          style: BorderStyle.solid
                        ),
                        onPressed: (){
                          _launchInApp(_metricUrl);
                        }
                    ),
                  ),
                  
                  new Container(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text("Report Bugs Here", style: TextStyle(color: Colors.lightBlueAccent),),
                      onPressed: (){
                        _launchInApp("https://forms.gle/qJCGaPgKSsq8uJat8");
                      },
                    ),
                  ),
                  


                ],
              ),

            ],
          ),
        ),
      )
    ),
    );
  }
}

