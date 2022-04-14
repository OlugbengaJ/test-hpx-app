import 'package:flutter/material.dart';

ThemeData dark_theme = ThemeData.dark().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
ThemeData light_theme = ThemeData.light().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
);


TextStyle h1Style = const TextStyle(fontSize: 25, color: Colors.white70);
TextStyle h2Style = const TextStyle(fontSize: 20, color: Colors.white70);
TextStyle h3Style = const TextStyle(fontSize: 18, color: Colors.white70);
TextStyle h4Style = const TextStyle(fontSize: 16, color: Colors.white70);
TextStyle labelStyle = const
    TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold);
TextStyle pStyle = const TextStyle(fontSize: 12, color: Colors.grey, fontFamily: "GoogleSans");

// const textBtnStyle = ButtonStyle();
