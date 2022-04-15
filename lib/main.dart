import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/wrapper.dart';
import 'package:hpx/providers/layers.dart';
import 'package:provider/provider.dart';
import "widgets/theme.dart";

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LayersProvider()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
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
