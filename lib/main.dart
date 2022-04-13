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
      darkTheme: dark_theme,
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
