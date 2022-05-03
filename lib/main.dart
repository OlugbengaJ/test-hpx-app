import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/wrapper.dart';
import 'package:hpx/providers/apps/zlightspace_providers/layers_provider/layers.dart';
import 'package:hpx/providers/apps/zlightspace_providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/apps/zlightspace_providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/providers/apps/zlightspace_providers/tools_effect_provider/mode_provider.dart';
import 'package:provider/provider.dart';
import 'providers/apps/zlightspace_providers/keyboard/keys_provider.dart';
import 'widgets/components/zone_selector/zone_selector_provider.dart';
import "widgets/theme.dart";

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LayersProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ColorPickerProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ModeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EffectProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ZoneSelectorProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => KeysProvider(),
        ),
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
