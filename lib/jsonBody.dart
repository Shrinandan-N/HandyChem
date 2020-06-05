import 'dart:convert';
import 'chemical.dart';

class jsonBody{
  Chemical chemBody;

  jsonBody(Map<String, dynamic> json){
    chemBody = Chemical(json['body']);
  }


}