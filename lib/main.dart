import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/wrapper.dart';
import "widgets/theme.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme.copyWith(
          sliderTheme: SliderTheme.of(context).copyWith(
        //slider modifications
        thumbColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade900,
        activeTrackColor: Colors.grey.shade900,
        overlayColor: Colors.grey.shade500,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 7.0),
      )),
      themeMode: ThemeMode.dark,
      title: 'HP Xperience',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const Wrapper(),
      },
    );
  }
}
