import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  highlightColor: Colors.transparent,
);
ThemeData lightTheme = ThemeData.light().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

// SliderTheme sliderStyle = SliderTheme({
//   SliderThemeData: SliderThemeData({
//     thumbColor: Colors.white,
//     inactiveTrackColor: Colors.grey.shade900,
//     activeTrackColor: Colors.grey.shade900,
//     overlayColor: Colors.grey.shade500,
//     thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
//     overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0)
//   })
// });

TextStyle h1Style = const TextStyle(
    fontSize: 25, color: Colors.white70, fontFamily: "GoogleSans");
TextStyle h2Style = const TextStyle(
    fontSize: 20, color: Colors.white70, fontFamily: "GoogleSans");
TextStyle h3Style = const TextStyle(
    fontSize: 18, color: Colors.white70, fontFamily: "GoogleSans");
TextStyle h4Style = const TextStyle(
    fontSize: 16, color: Colors.white70, fontFamily: "GoogleSans");
TextStyle h5Style = const TextStyle(
    fontSize: 14, color: Colors.white70, fontFamily: "GoogleSans");
TextStyle labelStyle =
    const TextStyle(fontSize: 14, color: Colors.grey, fontFamily: "GoogleSans");
TextStyle pStyle =
    const TextStyle(fontSize: 12, color: Colors.grey, fontFamily: "GoogleSans");

ButtonStyle textBtnStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
);

ButtonStyle textBtnStyleWhite = ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    )));
