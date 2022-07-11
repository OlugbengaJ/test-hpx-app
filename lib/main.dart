import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/globals.dart';
import 'package:hpx/providers/keys_provider.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/scrollbar_provider.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/providers/tools_effect_provider/widget/audiovisualizer_provider.dart';
import 'package:hpx/providers/tools_effect_provider/widget/contact_support_provider.dart';
import 'package:hpx/providers/tools_effect_provider/widget/image_mode_provder.dart';
import 'package:hpx/providers/tools_effect_provider/widget/shortcut_widget_provider.dart';
import 'package:hpx/providers/tutorial_provider/tutorial_provider.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:hpx/widgets/layouts/app_layout.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LayersProvider()),
          ChangeNotifierProvider(create: (_) => ColorPickerProvider()),
          ChangeNotifierProvider(create: (_) => ModeProvider()),
          ChangeNotifierProvider(create: (_) => ShortcutWidgetProvider()),
          ChangeNotifierProvider(create: (_) => ImageModeProvider()),
          ChangeNotifierProvider(create: (_) => ContactSupportWidgetProvider()),
          ChangeNotifierProvider(create: (_) => AudioVisualizerModeProvider()),
          ChangeNotifierProvider(create: (_) => TooltipTutorialProvider()),
          ChangeNotifierProvider(create: (_) => EffectProvider()),
          ChangeNotifierProvider(create: (context) => KeysProvider()),
          ChangeNotifierProvider(create: (context) => WorkspaceProvider()),
          ChangeNotifierProvider(create: (context) => ScrollbarProvider()),
        ],
        child: const MyApp(),
      ),
    );
     doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(600, 450);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Custom window with Flutter";
    win.show();
  });
    
    }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKeys,
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
        "/": (context) => const AppLayout(),
      },
    );
  }
}
