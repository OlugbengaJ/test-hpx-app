import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_key.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_key_copy.dart';
import 'package:hpx/providers/keyboard_provider.dart';
import 'package:provider/provider.dart';

class KeyboardRowFn extends StatelessWidget {
  const KeyboardRowFn({Key? key, required this.zoomScale}) : super(key: key);

  final double zoomScale;

  final keyModel = const KeyModel(
    keyCode: 'KEY_ESC',
    keyText: 'Esc',
    keyHeight: 0.0656403,
    keyRadius: 0.001594051,
    keyWidth: 0.03914955,
  );

  @override
  Widget build(BuildContext context) {
    const double _keyRadius = 0.001594051;
    const double _fnKeyWidth = 0.03314955;
    const double _keyWidth = 0.03914955;
    const double _keyHeight = 0.0656403;
    double _zoomedPadding = 2.0 * zoomScale;

    var c = Provider.of<KeyboardProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: Consumer<KeyboardProvider>(builder: (context, value, child) {
            debugPrint('added');

            return KeyboardKeyCopy(
              onTapHandler: () =>
                  debugPrint('\r\n key ${value.keys.isEmpty} triggered'),
              keyModel: keyModel,
              zoomScale: zoomScale,
            );
          }
              // KeyboardKey(
              //   onTapHandler: () => debugPrint('\r\n key esc triggered'),
              // decimalId: 27,
              //   keyText: 'Esc',
              //   keyTextColor: Colors.orange,
              //   keyPathColors: const [Colors.green, Colors.yellow],
              //   keyWidth: _keyWidth,
              //   keyHeight: _keyHeight,
              //   keyRadius: _keyRadius,
              //   zoomScale: zoomScale,
              // ),
              ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () {
              final newKey = KeyModel(
                  keyCode: keyModel.keyCode,
                  keyText: 'Leke',
                  keyWidth: keyModel.keyWidth,
                  keyHeight: keyModel.keyHeight,
                  keyRadius: keyModel.keyRadius,
                  // zoomScale: keyModel.zoomScale,
                  paintingStyle: PaintingStyle.fill);

              c.add(newKey);
              debugPrint('\r\n key F1 triggered');
            },
            keyCode: 'KEY_F1',
            keyText: 'F1',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key F2 triggered'),
            keyCode: 'KEY_F2',
            keyText: 'F2',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key F3 triggered'),
            keyCode: 'KEY_F3',
            keyText: 'F3',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key F4 triggered'),
            keyCode: 'KEY_F4',
            keyText: 'F4',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key F5 triggered'),
            keyCode: 'KEY_F5',
            keyText: 'F5',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key F6 triggered'),
            keyCode: 'KEY_F6',
            keyText: 'F6',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key F7 triggered'),
            keyCode: 'KEY_F7',
            keyText: 'F7',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key F8 triggered'),
            keyCode: 'KEY_F8',
            keyText: 'F8',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key F9 triggered'),
            keyCode: 'KEY_F9',
            keyText: 'F9',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key F10 triggered'),
            keyCode: 'KEY_F10',
            keyText: 'F10',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key F11 triggered'),
            keyCode: 'KEY_F11',
            keyText: 'F11',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key F12 triggered'),
            keyCode: 'KEY_F12',
            keyText: 'F12',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key home triggered'),
            keyCode: 'KEY_HOME',
            keyText: 'Home',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key end triggered'),
            keyCode: 'KEY_END',
            keyText: 'End',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key insert triggered'),
            keyCode: 'KEY_INSERT',
            keyText: 'Insert',
            keyWidth: _fnKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key del triggered'),
            keyCode: 'KEY_DELETE',
            keyText: 'Delete',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
      ],
    );
  }
}
