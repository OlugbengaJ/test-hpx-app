import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_key.dart';

class KeyboardRowNum extends StatelessWidget {
  const KeyboardRowNum({Key? key, required this.zoomScale}) : super(key: key);

  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    const double _keyRadius = 0.001594051;
    const double _backspaceKeyWidth = 0.08232708;
    const double _keyWidth = 0.03914955;
    const double _keyHeight = 0.1312806;
    double _zoomedPadding = 2.0 * zoomScale;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key tilda triggered'),
            keyCode: 'KEY_TILDE',
            keyText: '` ~',
            keyTextColor: Colors.purple.shade200,
            keyPathColors: const [Colors.pinkAccent, Colors.indigo],
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key 1 triggered'),
            keyCode: 'KEY_1',
            keyText: '1 !',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key 2 triggered'),
            keyCode: 'KEY_2',
            keyText: '2 @',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key 3 triggered'),
            keyCode: 'KEY_3',
            keyText: '3 #',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key 4 triggered'),
            keyCode: 'KEY_4',
            keyText: '4 \$',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key 5 triggered'),
            keyCode: 'KEY_5',
            keyText: '5 %',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key 6 triggered'),
            keyCode: 'KEY_6',
            keyText: '6 ^',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key 7 triggered'),
            keyCode: 'KEY_7',
            keyText: '7 &',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key 8 triggered'),
            keyCode: 'KEY_8',
            keyText: '8 *',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key 9 triggered'),
            keyCode: 'KEY_9',
            keyText: '9 (',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key 0 triggered'),
            keyCode: 'KEY_0',
            keyText: '0 )',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key - triggered'),
            keyCode: 'KEY_DASH',
            keyText: '- _',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key = triggered'),
            keyCode: 'KEY_EQUALS',
            keyText: '= +',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key backspace triggered'),
            keyCode: 'KEY_BACKSPACE',
            keyText: 'Backspace',
            keyWidth: _backspaceKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
      ],
    );
  }
}
