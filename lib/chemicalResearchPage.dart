import 'dart:io';

import 'package:chem_search/body.dart';
//import 'package:chem_search/toast_animation.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:rounded_floating_app_bar/rounded_floating_app_bar.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
//import 'toast_utils.dart';
import 'chemical.dart';
import 'jsonBody.dart';
//deleted simple animations
import 'package:flutter_typeahead/flutter_typeahead.dart';
//import 'package:html/parser.dart'




class chemPage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {

    return  new chemicalResearchPage();
  }
}

class chemicalResearchPage extends State<chemPage>{
  final searchText = TextEditingController();
  final crText = TextEditingController();
  List<String> chemnames;
  List<String> chemhashes;
  var suggestNames;
  String chemText;
  bool _value = false;
  List<String> parsedJSON;
//  var chemnames = List<String>();
//  var chemhashes = List<String>();

  RegExp string0 = new RegExp(r"000");
  RegExp string1 = new RegExp(r"1111");
  RegExp string2 = new RegExp(r"22222");
  RegExp stringlT = new RegExp(r"\&\lt");
  RegExp stringgT = new RegExp(r"\&\gt");
  RegExp hash1 =  new RegExp(r"\}|\{|\b(body)\b");
  RegExp hash2 = new RegExp(r"\}|\{|\b(body)\b|\:|\,");

  var testNames;

  var listhashes;
  var listnames;
  List<String> suggestednames = ["Hello", "I'm goldilocks"];

   Future<List<String>> getData(String hash) async{

      var queryParameters = {
        "chemID": hash //just one of the hashes (example)
      };

    var uri =
    Uri.https('www.chemsearch.info', '/api/getchemsds', queryParameters);

    Icon searchIcon = Icon(Icons.search);
    var objMapUrl = "https://chemsearch.info/api/getObjMap";
    Map queryData;
    http.Response response  = await http.get(
        Uri.encodeFull(objMapUrl),
        headers: {

          "x-api-key" : "0ofGM20ysnaAZ1FMW7IUq7WfANwhacaE20lQsSZY"
        }
    );

    var queryParams = await http.get(uri, headers: {
      "x-api-key" : "0ofGM20ysnaAZ1FMW7IUq7WfANwhacaE20lQsSZY"

    });



    if(response.statusCode == 200) {

      final data = json.decode(response.body);

      //query parameters

      queryData = json.decode(queryParams.body);


      listhashes = data["hashes"].cast<String>();
      listnames = data["chem names"].cast<String>();

      if (hash == "Hello") {
        chemText = "";
      } else {
        var newBody = jsonBody(queryData);
        chemText = ("${newBody.chemBody.chemName} \n    ${newBody.chemBody.messyFormula} \n\nSignal Word: ${newBody.chemBody.signalWord} \n\nHazards Identification: \n    ${newBody.chemBody.hazardId} \n\nFirst Aid Measures: \n    ${newBody.chemBody.firstAid} \n\n${newBody.chemBody.oralRat}");

      }
      //print(chemText);



      for(int i = 0; i < listnames.length - 1; i++) {


        listnames[i] = listnames[i].replaceAll(string0, '\/');
        listnames[i] = listnames[i].replaceAll(string1, '-');
        listnames[i] = listnames[i].replaceAll(string2, '.');

        listnames[i] = listnames[i].replaceAll(stringlT, '\<');
        listnames[i] = listnames[i].replaceAll(stringgT, '\>');


      }

      chemnames = listnames;
      chemhashes = listhashes;

        setState(() {
          //print(parsedJSON.toString());


          //print(parsedJSON);
          chemnames = listnames;
          chemhashes = listhashes;

          //print(chem.toString());
          crText.text = chemText;


        });

    }else{

      setState(() {
        chemnames = listnames;
        chemhashes = listhashes;
      });

      print("No Connection!");
//      ToastUtils.showCustomToast(context, "Please connect to internet!");
    }

    suggestNames = listnames;
    return suggestNames;

  }

  @override
  void initState() {
     super.initState();
     getData("Hello");

   }

   List<String> _filterCountries(value){
     List<String> filteredNames;

       filteredNames = chemnames.where((chemnames)=>
           chemnames.toLowerCase().contains((value.toString().toLowerCase()))
       ).toList();

       return filteredNames;
   }


  Widget row(String chemical){
      return ListTile(
        leading: Icon(Icons.colorize, color: Colors.blue,),
        title: Text(chemical.toString(), style: TextStyle(fontSize: 16.0),),
        contentPadding: EdgeInsets.all(2.0),
      );

  }

  @override
  Widget build(BuildContext context) {
    double maxLine = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
//
      appBar: AppBar(
        title: Text("Chemical Research"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1.5,
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.content_copy, color: Colors.white,),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: (){
          Clipboard.setData(ClipboardData(text: crText.text));
          showDialog(
              context: context,
              builder: (context) {
                Future.delayed(Duration(milliseconds: 500), () {
                  Navigator.of(context).pop(true);
                });
                return AlertDialog(
                  title: Text("Chemical Research Copied!", style: TextStyle(fontSize: 18, color: Colors.white),),
                  backgroundColor: Colors.lightBlueAccent,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              }

              );
//          ToastUtils.showCustomToast(context, "Chemical Research Copied to Clipboard!");
        },
      ),


      body: new Container(

        child: SingleChildScrollView(
          padding: new EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new TypeAheadField(

                  textFieldConfiguration: TextFieldConfiguration(
                    controller: searchText,

                     autofocus: false,
                     style: DefaultTextStyle.of(context).style.copyWith(
                       fontStyle: FontStyle.normal, fontSize: 16
                    ),
                     decoration: InputDecoration(
                       hintText: "Ex: Water",
                       prefixIcon: Icon(Icons.search, color: Colors.lightBlueAccent,),

                       border: OutlineInputBorder(),
                     )
                   ),

                  suggestionsCallback: (pattern) async{
                    return _filterCountries(pattern);
                  },
                  itemBuilder: (context, suggestion){
                    return ListTile(
                      leading: Icon(Icons.colorize, color: Colors.lightBlueAccent,),
                      title:  Text(suggestion),
                    );
                  },
                  onSuggestionSelected: (String txt){
                    searchText.text = txt;
                    if (chemnames.contains(txt)) {
                      var index = chemnames.indexOf(txt
                      ); //finds index of the chemical name searched
                      getData(chemhashes[index]);
                      print(getData(chemhashes[index]));
                    }else if(txt.isEmpty){
                      AlertDialog dialog = new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(15.0))),
                        title: Text("Please search for a chemical",
                          style: TextStyle(fontSize: 20.0),),
                        content: new Container(
                          width: 5.0,
                          height: 5.0,
                        ),
                        actions: <Widget>[
                          new FlatButton(onPressed: () {
                            Navigator.pop(context);
                          },
                              child: new Text("Ok",
                                style: TextStyle(fontSize: 20.0),))
                        ],

                      );
                      showDialog(context: context, child: dialog);
                    }else{
                      AlertDialog dialog = new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(15.0))),
                        title: Text("Chemical not found",
                          style: TextStyle(fontSize: 20.0),),
                        content: new Container(
                          width: 5.0,
                          height: 5.0,
                        ),
                        actions: <Widget>[
                          new FlatButton(onPressed: () {
                            Navigator.pop(context);
                          },
                              child: new Text("Ok",
                                style: TextStyle(fontSize: 20.0),))
                        ],

                      );
                      showDialog(context: context, child: dialog);
                    }
                  }
                  ),

              new Container(
                height: MediaQuery.of(context).size.height / 49,
              ),
              new Text("SDS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent)),
              new TextFormField(
                decoration: new InputDecoration(

                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: const BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 30.0,
                        style: BorderStyle.solid
                    )
                  )
                ),
               controller: crText,
                maxLines: (maxLine / 37).round(),


              ),
            ],
          ),

        ),
      ),
    ),
    );
  }

}

