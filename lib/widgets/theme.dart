import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
ThemeData lightTheme = ThemeData.light().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

TextStyle h1Style = const TextStyle(
    fontSize: 25, color: Colors.white70, fontFamily: "GoogleSans");
TextStyle h2Style = const TextStyle(
    fontSize: 20, color: Colors.white70, fontFamily: "GoogleSans");
TextStyle h3Style = const TextStyle(
    fontSize: 18, color: Colors.white70, fontFamily: "GoogleSans");
TextStyle h4Style = const TextStyle(
    fontSize: 16, color: Colors.white70, fontFamily: "GoogleSans");
TextStyle labelStyle = const TextStyle(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontFamily: "GoogleSans");
TextStyle pStyle =
    const TextStyle(fontSize: 12, color: Colors.grey, fontFamily: "GoogleSans");

// const textBtnStyle = ButtonStyle();
