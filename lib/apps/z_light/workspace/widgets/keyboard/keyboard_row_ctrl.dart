import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_key.dart';
import 'package:hpx/providers/keys_provider.dart';
import 'package:provider/provider.dart';

class KeyboardRowCtrl extends StatelessWidget {
  const KeyboardRowCtrl({Key? key, required this.zoomScale}) : super(key: key);

  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    double _zoomedPadding = 2.0 * zoomScale;

    final keysProvider = Provider.of<KeysProvider>(context);
    final rowKeysFiltered = keysProvider.getKeyInRow(6).where((element) =>
        element.keyCode != 'KEY_ARROW_UP' &&
        element.keyCode != 'KEY_ARROW_DOWN' &&
        element.keyCode != 'KEY_ARROW_RIGHT');
    final rowKeyRight = keysProvider.getKey('KEY_ARROW_RIGHT');
    final rowKeyUp = keysProvider.getKey('KEY_ARROW_UP');
    final rowKeyDown = keysProvider.getKey('KEY_ARROW_DOWN');

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...rowKeysFiltered.map(
          (keyModel) => Padding(
            padding: EdgeInsets.all(_zoomedPadding),
            child: ChangeNotifierProvider(
              create: (BuildContext context) => keyModel,
              child: KeyboardKey(
                onTapHandler: () {
                  debugPrint('\r\n key ${keyModel.keyCode} triggered');
                },
                zoomScale: zoomScale,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: _zoomedPadding, right: _zoomedPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: _zoomedPadding),
                child: ChangeNotifierProvider(
                  create: (BuildContext context) => rowKeyUp,
                  child: KeyboardKey(
                    onTapHandler: () {
                      debugPrint('\r\n key ${rowKeyUp.keyCode} triggered');
                    },
                    zoomScale: zoomScale,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _zoomedPadding),
                child: ChangeNotifierProvider(
                  create: (BuildContext context) => rowKeyDown,
                  child: KeyboardKey(
                    onTapHandler: () {
                      debugPrint('\r\n key ${rowKeyDown.keyCode} triggered');
                    },
                    zoomScale: zoomScale,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: ChangeNotifierProvider(
            create: (BuildContext context) => rowKeyRight,
            child: KeyboardKey(
              onTapHandler: () {
                debugPrint('\r\n key ${rowKeyRight.keyCode} triggered');
              },
              zoomScale: zoomScale,
            ),
          ),
        ),
      ],
    );
  }
}
