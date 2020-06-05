import 'dart:io';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';
import 'main.dart';
import 'dart:math' as math;


class elementPage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {

    return new elements();
  }
}


class elements extends State<elementPage> {
Color elementColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
      child: Scaffold(

        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,

        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Elements"),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 1.5,
        ),
        body: Center(

          child: FutureBuilder(builder: (context, snapshot){
            var tableData = json.decode(snapshot.data.toString());
            if(snapshot.hasData) {
              return GridView.builder(
                itemCount: tableData.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 15.0),
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    elevation: 10,
                    child: Center(
                      child: new InkWell(
                        onTap: (){
                          showGeneralDialog(
                              barrierColor: Colors.black.withOpacity(0.5),
                              transitionBuilder: (context, a1, a2, widget) {
                                return Transform.scale(
                                  scale: a1.value,
                                  child: Opacity(
                                    opacity: a1.value,
                                    child: AlertDialog(
                                      backgroundColor: Colors.white,
                                      shape: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16.0)),
                                      title: Column(
                                        children: <Widget>[
                                          Text(tableData[index]['atomicNumber'].toString(), style: TextStyle(color:   tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                                              fontSize: 15, fontWeight: FontWeight.w400),),
                                          Text(tableData[index]['symbol'].toString(), style: TextStyle(color:  tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                                              fontSize: 30, fontWeight: FontWeight.bold),),
                                          Text(tableData[index]['name'].toString(), style: TextStyle(color:   tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                                              fontSize: 15, fontWeight: FontWeight.w400),),

                                        ],
                                      ),
                                      content: Column(
                                        children: <Widget>[
                                          Flexible(
                                            child: SingleChildScrollView(
                                              child: DataTable(
                                                  columns: [
                                                    DataColumn(
                                                        label: Text("Category", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black))
                                                    ),
                                                    DataColumn(
                                                        label: Text("Information", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),)
                                                    ),
                                                  ],
                                                  rows: [
                                                    DataRow(
                                                        cells: [
                                                          DataCell(Text("Atomic Mass", style: TextStyle(color:   tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                                                              fontSize: 11, fontWeight: FontWeight.bold))),
                                                          DataCell(tableData[index]['atomicMass'].toString() == "" ? Text("--", style: TextStyle(fontSize: 20)) : Text(tableData[index]['atomicMass'].toString() + " amu")),
                                                        ]
                                                    ),
                                                    DataRow(
                                                        cells: [
                                                          DataCell(Text("Family", style: TextStyle(color:   tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                                                              fontSize: 11, fontWeight: FontWeight.bold))),
                                                          DataCell(tableData[index]['groupBlock'].toString() == "" ? Text("--", style: TextStyle(fontSize: 20)) : Text(tableData[index]['groupBlock'].toString())),
                                                        ]
                                                    ),
                                                    DataRow(
                                                        cells: [
                                                          DataCell(Text("Standard State", style: TextStyle(color:   tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                                                              fontSize: 11, fontWeight: FontWeight.bold))),
                                                          DataCell(tableData[index]['standardState'].toString() == "" ? Text("--", style: TextStyle(fontSize: 20)) : Text(tableData[index]['standardState'].toString())),
                                                        ]
                                                    ),

                                                    DataRow(
                                                        cells: [
                                                          DataCell(Text("Melting Point", style: TextStyle(color:  tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                                                              fontSize: 11, fontWeight: FontWeight.bold))),
                                                          DataCell(tableData[index]['meltingPoint'].toString() == "" ? Text("--", style: TextStyle(fontSize: 20)) : Text(tableData[index]['meltingPoint'].toString() + " K")),
                                                        ]
                                                    ),
                                                    DataRow(
                                                        cells: [
                                                          DataCell(Text("Boiling Point", style: TextStyle(color:   tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                                                              fontSize: 11, fontWeight: FontWeight.bold),)),
                                                          DataCell(tableData[index]['boilingPoint'].toString() == "" ? Text("--", style: TextStyle(fontSize: 20)) : Text(tableData[index]['boilingPoint'].toString() + " K")),
                                                        ]
                                                    ),
                                                    DataRow(
                                                        cells: [
                                                          DataCell(Text("Density", style: TextStyle(color:   tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                                                              fontSize: 11, fontWeight: FontWeight.bold))),
                                                          DataCell(tableData[index]['density'].toString() == "" ? Text("--", style: TextStyle(fontSize: 20)) : Text(tableData[index]['density'].toString() + " g/cm³")),
                                                        ]
                                                    ),
                                                    DataRow(
                                                        cells: [
                                                          DataCell(Text("Electronegativity", style: TextStyle(color:   tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                                                              fontSize: 11, fontWeight: FontWeight.bold))),
                                                          DataCell(tableData[index]['electronegativity'].toString() == "" ? Text("--", style: TextStyle(fontSize: 20)) : Text(tableData[index]['electronegativity'].toString())),
                                                        ]
                                                    ),
                                                    DataRow(
                                                        cells: [
                                                          DataCell(Text("Electron Affinity", style: TextStyle(color:   tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                                                              fontSize: 11, fontWeight: FontWeight.bold))),
                                                          DataCell(tableData[index]['electronAffinity'].toString() == "" ? Text("--", style: TextStyle(fontSize: 20)) : Text(tableData[index]['electronAffinity'].toString())),
                                                        ]
                                                    ),
                                                    DataRow(
                                                        cells: [
                                                          DataCell(Text("Ionization Energy", style: TextStyle(color:  tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                                                              fontSize: 11, fontWeight: FontWeight.bold))),
                                                          DataCell(tableData[index]['ionizationEnergy'].toString() == "" ? Text("--", style: TextStyle(fontSize: 20)) : Text(tableData[index]['ionizationEnergy'].toString() + " kJ/mol")),
                                                        ]
                                                    ),DataRow(
                                                        cells: [
                                                          DataCell(Text("Electron Configuration", style: TextStyle(color:   tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                                                              fontSize: 11, fontWeight: FontWeight.bold))),
                                                          DataCell(tableData[index]['electronicConfiguration'].toString() == "" ? Text("--", style: TextStyle(fontSize: 20)) : Text(tableData[index]['electronicConfiguration'].toString())),
                                                        ]
                                                    ),
                                                    DataRow(
                                                        cells: [
                                                          DataCell(Text("Year Discovered", style: TextStyle(color:  tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                                                              fontSize: 11, fontWeight: FontWeight.bold))),
                                                          DataCell(tableData[index]['yearDiscovered'].toString() == "" ? Text("--", style: TextStyle(fontSize: 20)) : Text(tableData[index]['yearDiscovered'].toString())),
                                                        ]
                                                    ),


                                                  ]
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                  ),
                                );
                              },
                              transitionDuration: Duration(milliseconds: 200),
                              barrierDismissible: true,
                              barrierLabel: '',
                              context: context,
                              pageBuilder: (context, animation1, animation2) {});

                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                          Text(tableData[index]['atomicNumber'].toString(), style: TextStyle(color:tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,
                          ),),
                          Text(tableData[index]['symbol'].toString(), style: TextStyle(fontSize: 30,color:       tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,

                              fontWeight: FontWeight.bold),),
                          Text(tableData[index]['name'].toString(), style: TextStyle(color:tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,

                              fontSize: 15),),
                          Text(tableData[index]['atomicMass'].toString(), style: TextStyle(color:        tableData[index]['groupBlock'].toString() == "nonmetal" ? Colors.red : tableData[index]['groupBlock'].toString() == "alkali metal" ? Colors.blue: tableData[index]['groupBlock'].toString() == "alkaline earth metal" ? Colors.teal : tableData[index]['groupBlock'].toString() == "transition metal" ? Colors.lightGreen[600] : tableData[index]['groupBlock'].toString() == "metal" ? Colors.orange[200] : tableData[index]['groupBlock'].toString() == "metalloid" ? Colors.orange : tableData[index]['groupBlock'].toString() == "halogen" ? Colors.yellowAccent[700] : tableData[index]['groupBlock'].toString() == "noble gas" ? Colors.purpleAccent : tableData[index]['groupBlock'].toString() == "actinoid" ? Colors.deepPurpleAccent : tableData[index]['groupBlock'].toString() == "lanthanoid" ? Colors.pink : Colors.blueGrey,

                              fontSize: 10),),
                        ],
                        ),
                      ),


                    ),
                      color: Colors.white,
                  );
                },

              );
            }else{
              return CircularProgressIndicator();
            }
          }, future: DefaultAssetBundle.of(context).loadString('assets/tableElements.json')
          ),
        ),
      ), //Scaffold

      ),

    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

