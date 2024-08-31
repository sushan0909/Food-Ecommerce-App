import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        fontFamily: 'Poppins');
  }

  static TextStyle headLineTextFieldStyle() {
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
        fontFamily: 'Poppins');
  }

  static TextStyle lightTextFieldStyle() {
    return TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        fontFamily: 'Poppins');
  }

  static TextStyle semiBoldTextFieldStyle() {
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
        fontFamily: 'Poppins');
  }

  static TextStyle smallBoldTextFieldStyle() {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: "Poppins");
  }

  static TextStyle lightSmallTextFieldStyle() {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black38,
        fontFamily: "Poppins");
  }
}
