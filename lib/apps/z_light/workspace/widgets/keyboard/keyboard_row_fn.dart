import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_key.dart';
import 'package:hpx/providers/keys_provider.dart';
import 'package:provider/provider.dart';

class KeyboardRowFn extends StatelessWidget {
  const KeyboardRowFn({Key? key, required this.zoomScale}) : super(key: key);

  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    double _zoomedPadding = 2.0 * zoomScale;

    final keysProvider = Provider.of<KeysProvider>(context);
    final rowKeys = keysProvider.getKeyInRow(1);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...rowKeys.map(
          (keyModel) => Padding(
            padding: EdgeInsets.all(_zoomedPadding),
            child: ChangeNotifierProvider(
              create: (BuildContext context) => keyModel,
              // builder: (c, g) => KeyboardKeyCopy(
              //   onTapHandler: () =>
              //       debugPrint('\r\n key ${keyModel.keyCode} triggered'),
              //   keyModel: keyModel,
              //   zoomScale: zoomScale,
              // ),
              child: DragTarget<bool>(
                builder: (context, candidateData, rejectedData) => KeyboardKey(
                  onTapHandler: () {
                    debugPrint('\r\n key ${keyModel.keyCode} triggered');
                  },
                  zoomScale: zoomScale,
                ),
                onAccept: (e) {
                  debugPrint('fn row $e');
                  keyModel.keyHighlighted();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
