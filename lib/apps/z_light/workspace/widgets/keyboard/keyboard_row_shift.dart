import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_key.dart';

class KeyboardRowShift extends StatelessWidget {
  const KeyboardRowShift({Key? key, required this.zoomScale}) : super(key: key);

  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    const double _keyRadius = 0.001594051;
    const double _lShiftKeyWidth = 0.09361081;
    const double _rShiftKeyWidth = 0.1142209;
    const double _keyWidth = 0.03914955;
    const double _keyHeight = 0.1312806;
    double _zoomedPadding = 2.0 * zoomScale;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key Left Shift triggered'),
            keyText: 'Shift',
            keyWidth: _lShiftKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key Z triggered'),
            keyText: 'Z',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key X triggered'),
            keyText: 'X',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key C triggered'),
            keyText: 'C',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key V triggered'),
            keyText: 'V',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key B triggered'),
            keyText: 'B',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key N triggered'),
            keyText: 'N',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key M triggered'),
            keyText: 'M',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key , triggered'),
            keyText: ', <',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key period . triggered'),
            keyText: '. >',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key / triggered'),
            keyText: '/ ?',
            keyWidth: _keyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_zoomedPadding),
          child: KeyboardKey(
            onTapHandler: () => debugPrint('\r\n key Right Shift triggered'),
            keyText: 'Shift',
            keyWidth: _rShiftKeyWidth,
            keyHeight: _keyHeight,
            keyRadius: _keyRadius,
            zoomScale: zoomScale,
          ),
        ),
      ],
    );
  }
}
