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
                    keyText: 'P.Up',
                    keyWidth: _keyWidth,
                    keyHeight: _arrowKeyHeight,
                    keyRadius: _keyRadius,
                    zoomScale: zoomScale,
                  ),
                  KeyboardKey(
                    onTapHandler: () => debugPrint('\r\n key Up triggered'),
                    keyText: '↑',
                    keyWidth: _keyWidth,
                    keyHeight: _arrowKeyHeight,
                    keyRadius: _keyRadius,
                    zoomScale: zoomScale,
                  ),
                  KeyboardKey(
                    onTapHandler: () =>
                        debugPrint('\r\n key Page Down triggered'),
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
                    keyText: '←',
                    keyWidth: _keyWidth,
                    keyHeight: _arrowKeyHeight,
                    keyRadius: _keyRadius,
                    zoomScale: zoomScale,
                  ),
                  KeyboardKey(
                    onTapHandler: () => debugPrint('\r\n key Down triggered'),
                    keyText: '↓',
                    keyWidth: _keyWidth,
                    keyHeight: _arrowKeyHeight,
                    keyRadius: _keyRadius,
                    zoomScale: zoomScale,
                  ),
                  KeyboardKey(
                    onTapHandler: () => debugPrint('\r\n key Right triggered'),
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
