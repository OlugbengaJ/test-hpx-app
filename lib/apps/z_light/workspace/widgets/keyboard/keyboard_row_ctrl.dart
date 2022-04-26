import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_key.dart';

class KeyboardRowCtrl extends StatelessWidget {
  const KeyboardRowCtrl({Key? key, required this.zoomScale}) : super(key: key);

  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    const double _keyRadius = 0.001594051;
    const double _lCtrlKeyWidth = 0.04778506;
    const double _rCtrlKeyWidth = 0.04778506;
    const double _spacebarKeyWidth = 0.2499037;
    const double _keyWidth = 0.03914955;
    const double _keyHeight = 0.1312806;
    const double _arrowKeyHeight = 0.0656403;

    double _zoomedPadding = 2.0 * zoomScale;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key Left Ctrl triggered'),
            keyCode: 'KEY_CTRL_LEFT',
            keyText: 'Ctrl',
            keyWidth: _lCtrlKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key Fn triggered'),
            keyCode: 'KEY_FN',
            keyText: 'Fn',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key Win triggered'),
            keyCode: 'KEY_WIN',
            keyText: 'Win',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key Left Alt triggered'),
            keyCode: 'KEY_ALT_LEFT',
            keyText: 'Alt',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key Spacebar triggered'),
            keyCode: 'KEY_SPACEBAR',
            keyWidth: _spacebarKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key Right Alt triggered'),
            keyCode: 'KEY_ALT_RIGHT',
            keyText: 'Alt',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key Right Ctrl triggered'),
            keyCode: 'KEY_CTRL_RIGHT',
            keyText: 'Ctrl',
            keyWidth: _rCtrlKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  KeyboardKey(
                    onTapHandler: () =>
                        debugPrint('\r\n key Page Up triggered'),
                    keyCode: 'KEY_PAGE_UP',
                    keyText: 'P.Up',
                    keyWidth: _keyWidth,
                    keyHeight: _arrowKeyHeight,
                    keyRadius: _keyRadius,
                    zoomScale: zoomScale,
                  ),
                  KeyboardKey(
                    onTapHandler: () => debugPrint('\r\n key Up triggered'),
                    keyCode: 'KEY_ARROW_UP',
                    keyText: '↑',
                    keyWidth: _keyWidth,
                    keyHeight: _arrowKeyHeight,
                    keyRadius: _keyRadius,
                    zoomScale: zoomScale,
                  ),
                  KeyboardKey(
                    onTapHandler: () =>
                        debugPrint('\r\n key Page Down triggered'),
                    keyCode: 'KEY_PAGE_DOWN',
                    keyText: 'P.Down',
                    keyWidth: _keyWidth,
                    keyHeight: _arrowKeyHeight,
                    keyRadius: _keyRadius,
                    zoomScale: zoomScale,
                  ),
                ],
              ),
              Row(
                children: [
                  KeyboardKey(
                    onTapHandler: () => debugPrint('\r\n key Left triggered'),
                    keyCode: 'KEY_ARROW_LEFT',
                    keyText: '←',
                    keyWidth: _keyWidth,
                    keyHeight: _arrowKeyHeight,
                    keyRadius: _keyRadius,
                    zoomScale: zoomScale,
                  ),
                  KeyboardKey(
                    onTapHandler: () => debugPrint('\r\n key Down triggered'),
                    keyCode: 'KEY_ARROW_DOWN',
                    keyText: '↓',
                    keyWidth: _keyWidth,
                    keyHeight: _arrowKeyHeight,
                    keyRadius: _keyRadius,
                    zoomScale: zoomScale,
                  ),
                  KeyboardKey(
                    onTapHandler: () => debugPrint('\r\n key Right triggered'),
                    keyCode: 'KEY_ARROW_RIGHT',
                    keyText: '→',
                    keyWidth: _keyWidth,
                    keyHeight: _arrowKeyHeight,
                    keyRadius: _keyRadius,
                    zoomScale: zoomScale,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
