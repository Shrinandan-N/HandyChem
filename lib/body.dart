import 'chemical.dart';
class jBody {
  String body;

  jBody(this.body);

  factory jBody.fromJson(dynamic json) {

    return jBody(

      json['body']

    );

  }

  @override
  String toString() {
    return '{ ${this.body}}';
  }
}