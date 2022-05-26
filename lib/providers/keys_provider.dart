import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/workspace_models/key_code.dart';
import 'package:hpx/providers/key_model.dart';

class KeysProvider with ChangeNotifier {
  final List<KeyModel> _keys = [
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kEsc,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('esc'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kF1,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('f1'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kF2,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('f2'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kF3,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('f3'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kF4,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('f4'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kF5,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('f5'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kF6,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('f6'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kF7,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('f7'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kF8,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('f8'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kF9,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('f9'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kF10,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('f10'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kF11,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('f11'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kF12,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('f12'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kCam,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('cam'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kPower,
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('pwr'),
    KeyModel(
      keyRow: 0,
      keyCode: KeyCode.kDelete,
      keyWidth: 0.036371396875, //0.03914955,
      keyHeight: 0.0656403,
      keyRadius: 0.063100338,
    )..addChipText('delete'),
    KeyModel(
      keyRow: 1,
      keyCode: KeyCode.kTilda,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('` ~'),
    KeyModel(
      keyRow: 1,
      keyCode: KeyCode.k1,
      keyWidth: 0.03914955, //0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('1 !'),
    KeyModel(
      keyRow: 1,
      keyCode: KeyCode.k2,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('2 @'),
    KeyModel(
      keyRow: 1,
      keyCode: KeyCode.k3,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('3 #'),
    KeyModel(
      keyRow: 1,
      keyCode: KeyCode.k4,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('4 \$'),
    KeyModel(
      keyRow: 1,
      keyCode: KeyCode.k5,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('5 %'),
    KeyModel(
      keyRow: 1,
      keyCode: KeyCode.k6,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('6 ^'),
    KeyModel(
      keyRow: 1,
      keyCode: KeyCode.k7,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('7 &'),
    KeyModel(
      keyRow: 1,
      keyCode: KeyCode.k8,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('8 *'),
    KeyModel(
      keyRow: 1,
      keyCode: KeyCode.k9,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('9 ('),
    KeyModel(
      keyRow: 1,
      keyCode: KeyCode.k0,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('0 )'),
    KeyModel(
      keyRow: 1,
      keyCode: KeyCode.kDash,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('- _'),
    KeyModel(
      keyRow: 1,
      keyCode: KeyCode.kEquals,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('= +'),
    KeyModel(
      keyRow: 1,
      keyCode: KeyCode.kBackspace,
      keyWidth: 0.08232708,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('backspace'),
    KeyModel(
      keyRow: 2,
      keyCode: KeyCode.kTab,
      keyWidth: 0.06137159,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('tab'),
    KeyModel(
      keyRow: 2,
      keyCode: KeyCode.kQ,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('Q'),
    KeyModel(
      keyRow: 2,
      keyCode: KeyCode.kW,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('W'),
    KeyModel(
      keyRow: 2,
      keyCode: KeyCode.kE,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('E'),
    KeyModel(
      keyRow: 2,
      keyCode: KeyCode.kR,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('R'),
    KeyModel(
      keyRow: 2,
      keyCode: KeyCode.kT,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('T'),
    KeyModel(
      keyRow: 2,
      keyCode: KeyCode.kY,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('Y'),
    KeyModel(
      keyRow: 2,
      keyCode: KeyCode.kU,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('U'),
    KeyModel(
      keyRow: 2,
      keyCode: KeyCode.kI,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('I'),
    KeyModel(
      keyRow: 2,
      keyCode: KeyCode.kO,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('O'),
    KeyModel(
      keyRow: 2,
      keyCode: KeyCode.kP,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('P'),
    KeyModel(
      keyRow: 2,
      keyCode: KeyCode.kBracketLeft,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('[ {'),
    KeyModel(
      keyRow: 2,
      keyCode: KeyCode.kBracketRight,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('] }'),
    KeyModel(
      keyRow: 2,
      keyCode: KeyCode.kBackSlash,
      keyWidth: 0.06010505,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('\\ |'),
    KeyModel(
      keyRow: 3,
      keyCode: KeyCode.kCaps,
      keyWidth: 0.07202205,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('caps lock'),
    KeyModel(
      keyRow: 3,
      keyCode: KeyCode.kA,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('A'),
    KeyModel(
      keyRow: 3,
      keyCode: KeyCode.kS,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('S'),
    KeyModel(
      keyRow: 3,
      keyCode: KeyCode.kD,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('D'),
    KeyModel(
      keyRow: 3,
      keyCode: KeyCode.kF,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('F'),
    KeyModel(
      keyRow: 3,
      keyCode: KeyCode.kG,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('G'),
    KeyModel(
      keyRow: 3,
      keyCode: KeyCode.kH,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('H'),
    KeyModel(
      keyRow: 3,
      keyCode: KeyCode.kJ,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('J'),
    KeyModel(
      keyRow: 3,
      keyCode: KeyCode.kK,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('K'),
    KeyModel(
      keyRow: 3,
      keyCode: KeyCode.kL,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('L'),
    KeyModel(
      keyRow: 3,
      keyCode: KeyCode.kColon,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('; :'),
    KeyModel(
      keyRow: 3,
      keyCode: KeyCode.kQuote,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('\' "'),
    KeyModel(
      keyRow: 3,
      keyCode: KeyCode.kEnter,
      keyWidth: 0.09263212,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('enter'),
    KeyModel(
      keyRow: 4,
      keyCode: KeyCode.kShiftLeft,
      keyWidth: 0.09361081,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('shift'),
    KeyModel(
      keyRow: 4,
      keyCode: KeyCode.kZ,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('Z'),
    KeyModel(
      keyRow: 4,
      keyCode: KeyCode.kX,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('X'),
    KeyModel(
      keyRow: 4,
      keyCode: KeyCode.kC,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('C'),
    KeyModel(
      keyRow: 4,
      keyCode: KeyCode.kV,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('V'),
    KeyModel(
      keyRow: 4,
      keyCode: KeyCode.kB,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('B'),
    KeyModel(
      keyRow: 4,
      keyCode: KeyCode.kN,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('N'),
    KeyModel(
      keyRow: 4,
      keyCode: KeyCode.kM,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('M'),
    KeyModel(
      keyRow: 4,
      keyCode: KeyCode.kComma,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText(', <'),
    KeyModel(
      keyRow: 4,
      keyCode: KeyCode.kPeriod,
      //keyText: '. >',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('. >'),
    KeyModel(
      keyRow: 4,
      keyCode: KeyCode.kForwardSlash,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('/ ?'),
    KeyModel(
      keyRow: 4,
      keyCode: KeyCode.kShiftRight,
      keyWidth: 0.1142209,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('shift'),
    KeyModel(
      keyRow: 5,
      keyCode: KeyCode.kCtrlLeft,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('ctrl'),
    KeyModel(
      keyRow: 5,
      keyCode: KeyCode.kFn,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('fn'),
    KeyModel(
      keyRow: 5,
      keyCode: KeyCode.kWin,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipIcon([
        KeyIconPath()
          ..x = 0.4198938
          ..y = 0.1429925
          ..keyIconLines = [
            const KeyIconLine(0.06250000, 0.2045453),
            const KeyIconLine(0.06250000, 0.4507563),
            const KeyIconLine(0.4198938, 0.4507563),
            const KeyIconLine(0.4198938, 0.1429925),
          ],
        KeyIconPath()
          ..x = 0.9375000
          ..y = 0.09375000
          ..keyIconLines = [
            const KeyIconLine(0.4938375, 0.1429925),
            const KeyIconLine(0.4938375, 0.4507563),
            const KeyIconLine(0.9375000, 0.4507563),
            const KeyIconLine(0.9375000, 0.09375000),
          ],
        KeyIconPath()
          ..x = 0.4198938
          ..y = 0.5123094
          ..keyIconLines = [
            const KeyIconLine(0.06250000, 0.5123094),
            const KeyIconLine(0.06250000, 0.7831438),
            const KeyIconLine(0.4198938, 0.8323875),
            const KeyIconLine(0.4198938, 0.5123094),
          ],
        KeyIconPath()
          ..x = 0.9375000
          ..y = 0.5123094
          ..keyIconLines = [
            const KeyIconLine(0.4938375, 0.5123094),
            const KeyIconLine(0.4938375, 0.8323875),
            const KeyIconLine(0.9375000, 0.9062500),
            const KeyIconLine(0.9375000, 0.5123094),
          ],
      ]),
    KeyModel(
      keyRow: 5,
      keyCode: KeyCode.kAltLeft,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('alt'),
    KeyModel(
      keyRow: 5,
      keyCode: KeyCode.kSpacebar,
      keyWidth: 0.2489037,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    ),
    KeyModel(
      keyRow: 5,
      keyCode: KeyCode.kAltRight,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('alt'),
    KeyModel(
      keyRow: 5,
      keyCode: KeyCode.kCrtlRight,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('ctrl'),
    KeyModel(
      keyRow: 5,
      keyCode: KeyCode.kArrowLeft,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('←'),
    KeyModel(
      keyRow: 5,
      keyCode: KeyCode.kArrowUp,
      keyWidth: 0.04778506,
      keyHeight: 0.0573403,
      keyRadius: 0.063100338,
    )..addChipText('↑'),
    KeyModel(
      keyRow: 5,
      keyCode: KeyCode.kArrowDown,
      keyWidth: 0.04778506,
      keyHeight: 0.0573403,
      keyRadius: 0.063100338,
    )..addChipText('↓'),
    KeyModel(
      keyRow: 5,
      keyCode: KeyCode.kArrowRight,
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.063100338,
    )..addChipText('→'),
  ];

  List<KeyModel> get keys => [..._keys];

  /// Add a new [key]
  void add(KeyModel key) {
    if (_keys.isEmpty ||
        _keys.any((element) => element.keyCode != key.keyCode)) {
      _keys.add(key);

      // This call tells widgets listening to this model to rebuild.
      notifyListeners();
    }
  }

  /// Replaces an existing [key]
  void replace(KeyModel key) {
    int keyIndex =
        _keys.indexWhere((element) => element.keyCode == key.keyCode);
    _keys.removeAt(keyIndex);
    _keys.insert(keyIndex, key);

    // This call tells widgets listening to this model to rebuild.
    notifyListeners();
  }

  List<KeyModel> getKeyInRow(int rowId) {
    return _keys.where((element) => element.keyRow == rowId).toList();
  }

  KeyModel getKey(KeyCode keyCode) {
    return _keys.firstWhere((element) => element.keyCode == keyCode);
  }
}
