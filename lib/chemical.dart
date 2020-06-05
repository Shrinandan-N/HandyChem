import 'dart:convert';

class Chemical {
  String chemName;
  String messyFormula;
  List<dynamic> hazardId;
  List<dynamic> firstAid;
  String signalWord;
  String oralRat;
//
//
//  Chemical(this.chemName, this.messyFormula, this.signalWord, this.hazardId, this.firstAid, this.oralRat);

   Chemical(Map<String, dynamic> jsonData) {

    chemName = jsonData['ChemName'];
    messyFormula = jsonData['MessyFormula'];
    hazardId = jsonData['HazardIdentification'];
    firstAid = jsonData['FirstAid'];
    signalWord = jsonData['SignalWord'];
    oralRat = jsonData['-'];

  }

//  @override
//  String toString() {
//    return '{ ${this.chemName}, ${this.messyFormula}, ${this.signalWord}, ${this.hazardId}, ${this.firstAid}, ${this.oralRat} }';
//  }
}