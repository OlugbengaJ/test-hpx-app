import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_key.dart';
import 'package:hpx/providers/keys_provider.dart';
import 'package:provider/provider.dart';

class KeyboardRowFn extends StatelessWidget {
  /// [KeyboardRowFn] displays keys in the function key row i.e. esc to delete.
  ///
  /// Actual keys are drawn by [KeyboardKey].
  const KeyboardRowFn({Key? key, required this.zoomScale}) : super(key: key);

  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    double zoomedPadding = 2.0 * zoomScale;

    final keysProvider = Provider.of<KeysProvider>(context);
    final rowKeys = keysProvider.getKeyInRow(0);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...rowKeys.map(
          (keyModel) => Padding(
            padding: EdgeInsets.all(zoomedPadding),

            // use ChangeNotifierProvider.value() when using child values of Provider.of()
            // as notifier; otherwise you encounter errors with ChangeNotifierProvider(create)
            // when flutter rebuilds the widget tree
            child: ChangeNotifierProvider.value(
              value: keyModel,
              builder: (_, w) => KeyboardKey(
                key: ValueKey(keyModel.keyCode),
                onTapHandler: () {
                  debugPrint('\r\n key ${keyModel.keyCode} triggered');
                },
                zoomScale: zoomScale,
              ),
            ),
          ),
        ),
      ],
    );
  }
}