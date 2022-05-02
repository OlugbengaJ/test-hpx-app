import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_key.dart';
import 'package:hpx/providers/keys_provider.dart';
import 'package:provider/provider.dart';

class KeyboardRowNum extends StatelessWidget {
  const KeyboardRowNum({Key? key, required this.zoomScale}) : super(key: key);

  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    double _zoomedPadding = 2.0 * zoomScale;

    final keysProvider = Provider.of<KeysProvider>(context);
    final rowKeys = keysProvider.getKeyInRow(2);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...rowKeys.map(
          (keyModel) => Padding(
            padding: EdgeInsets.all(_zoomedPadding),

            // use ChangeNotifierProvider.value() when using child values of Provider.of()
            // as notifier; otherwise you encounter errors with ChangeNotifierProvider(create)
            // when flutter rebuilds the widget tree
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
      ],
    );
  }
}
