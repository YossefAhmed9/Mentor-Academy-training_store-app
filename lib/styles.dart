import 'package:flutter/material.dart';

class Styles {
  static const  TextStyle title1 = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 25, fontFamily: 'Sectra');

  static const  TextStyle bookTitle =  TextStyle(
    fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis,
    fontSize: 22,
    fontFamily: 'Sectra',
  );

  static const TextStyle authorName =
  TextStyle(fontSize: 15, fontFamily: 'Sectra', color: Colors.grey);

  static const  TextStyle rating = TextStyle(
      fontWeight: FontWeight.w300, fontSize: 18, fontFamily: 'Sectra');

  static const TextStyle price = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 18, fontFamily: 'Sectra');
}
