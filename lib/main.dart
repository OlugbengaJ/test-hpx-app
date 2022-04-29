import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/globals.dart';
import 'package:hpx/apps/z_light/wrapper.dart';
import 'package:hpx/providers/keys_provider.dart';
import 'package:hpx/providers/layers.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LayersProvider()),
        ChangeNotifierProvider(create: (context) => KeysProvider()),
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldKey,
      darkTheme: darkTheme.copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbColor: Colors.white,
          inactiveTrackColor: Colors.grey.shade900,
          activeTrackColor: Colors.grey.shade900,
          overlayColor: Colors.grey.shade500,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5.0),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 7.0),
        ),
      ),
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
