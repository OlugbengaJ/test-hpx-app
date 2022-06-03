import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_key.dart';
import 'package:hpx/models/apps/zlightspace_models/workspace_models/key_code.dart';
import 'package:hpx/providers/keys_provider.dart';
import 'package:provider/provider.dart';

class KeyboardRowCtrl extends StatelessWidget {
  /// [KeyboardRowCtrl] displays keys in the ctrl row i.e. ctrl to arrow_right.
  ///
  /// Actual keys are drawn by [KeyboardKey].
  const KeyboardRowCtrl({Key? key, required this.zoomScale}) : super(key: key);

  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    double zoomedPadding = 2.0 * zoomScale;

    final keysProvider = Provider.of<KeysProvider>(context);
    final rowKeysFiltered = keysProvider.getKeysInRow(5).where((element) =>
        element.keyCode != KeyCode.kArrowUp &&
        element.keyCode != KeyCode.kArrowDown &&
        element.keyCode != KeyCode.kArrowRight);
    final rowKeyRight = keysProvider.getKey(KeyCode.kArrowRight);
    final rowKeyUp = keysProvider.getKey(KeyCode.kArrowUp);
    final rowKeyDown = keysProvider.getKey(KeyCode.kArrowDown);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...rowKeysFiltered.map(
          (keyModel) => Padding(
            padding: EdgeInsets.all(zoomedPadding),

            // use ChangeNotifierProvider.value() when using child values of
            // Provider.of() as notifier; otherwise you encounter errors with
            // ChangeNotifierProvider(create) when flutter rebuilds the widget tree.
            child: ChangeNotifierProvider.value(
              value: keyModel,
              builder: (context, child) => KeyboardKey(
                onTapHandler: () {
                  debugPrint('\r\n key ${keyModel.keyCode} triggered');
                },
                zoomScale: zoomScale,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: zoomedPadding, right: zoomedPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: zoomedPadding),
                child: ChangeNotifierProvider.value(
                  value: rowKeyUp,
                  builder: (context, child) => KeyboardKey(
                    onTapHandler: () {
                      debugPrint('\r\n key ${rowKeyUp.keyCode} triggered');
                    },
                    zoomScale: zoomScale,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: zoomedPadding),
                child: ChangeNotifierProvider.value(
                  value: rowKeyDown,
                  builder: (context, child) => KeyboardKey(
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
          padding: EdgeInsets.all(zoomedPadding),
          child: ChangeNotifierProvider.value(
            value: rowKeyRight,
            builder: (context, child) => KeyboardKey(
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
