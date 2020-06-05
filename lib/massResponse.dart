import 'package:flutter/material.dart';
import 'dart:convert';
class massResponse{
  final String formattedFormula;
  final String formulaMolarMass;
  final bool isValidMolecularFormula;

  massResponse({this.formattedFormula, this.formulaMolarMass, this.isValidMolecularFormula});

  factory massResponse.fromJson(Map<String, dynamic> json) {
    return massResponse(
      formattedFormula: json['formattedFormula'],
      formulaMolarMass: json['formulaMolarMass'],
      isValidMolecularFormula: json['isValidMolecularFormula'],
    );
  }

}