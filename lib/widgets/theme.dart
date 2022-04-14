import 'package:flutter/material.dart';

ThemeData dark_theme = ThemeData.dark().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
ThemeData light_theme = ThemeData.light().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

const h1Style = TextStyle(fontSize: 25, color: Colors.white70);
const h2Style = TextStyle(fontSize: 20, color: Colors.white70);
const h3Style = TextStyle(fontSize: 18, color: Colors.white70);
const h4Style = TextStyle(fontSize: 16, color: Colors.white70);
const labelStyle =
    TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold);

// const textBtnStyle = ButtonStyle();
