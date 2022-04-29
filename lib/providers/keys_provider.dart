import 'package:flutter/material.dart';
import 'package:hpx/models/key_model.dart';

class KeysProvider with ChangeNotifier {
  final List<KeyModel> _keys = [
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_ESC',
      keyText: 'esc',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_F1',
      keyText: 'f1',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_F2',
      keyText: 'f2',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_F3',
      keyText: 'f3',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_F4',
      keyText: 'f4',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_F5',
      keyText: 'f5',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_F6',
      keyText: 'f6',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_F7',
      keyText: 'f7',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_F8',
      keyText: 'f8',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_F9',
      keyText: 'f9',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_F10',
      keyText: 'f10',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_F11',
      keyText: 'f11',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_F12',
      keyText: 'f12',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_CAM',
      keyText: 'cam',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_POWER',
      keyText: 'pwr',
      keyWidth: 0.036371396875,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 1,
      keyCode: 'KEY_DELETE',
      keyText: 'delete',
      keyWidth: 0.036371396875, //0.03914955,
      keyHeight: 0.0656403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 2,
      keyCode: 'KEY_TILDA',
      keyText: '` ~',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 2,
      keyCode: 'KEY_1',
      keyText: '1 !',
      keyWidth: 0.03914955, //0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 2,
      keyCode: 'KEY_2',
      keyText: '2 @',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 2,
      keyCode: 'KEY_3',
      keyText: '3 #',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 2,
      keyCode: 'KEY_4',
      keyText: '4 \$',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 2,
      keyCode: 'KEY_5',
      keyText: '5 %',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 2,
      keyCode: 'KEY_6',
      keyText: '6 ^',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 2,
      keyCode: 'KEY_7',
      keyText: '7 &',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 2,
      keyCode: 'KEY_8',
      keyText: '8 *',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 2,
      keyCode: 'KEY_9',
      keyText: '9 (',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 2,
      keyCode: 'KEY_0',
      keyText: '0 )',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 2,
      keyCode: 'KEY_DASH',
      keyText: '- _',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 2,
      keyCode: 'KEY_EQUALS',
      keyText: '= +',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 2,
      keyCode: 'KEY_BACKSPACE',
      keyText: 'backspace',
      keyWidth: 0.08232708,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 3,
      keyCode: 'KEY_TAB',
      keyText: 'tab',
      keyWidth: 0.06137159,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 3,
      keyCode: 'KEY_Q',
      keyText: 'Q',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 3,
      keyCode: 'KEY_W',
      keyText: 'W',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 3,
      keyCode: 'KEY_E',
      keyText: 'E',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 3,
      keyCode: 'KEY_R',
      keyText: 'R',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 3,
      keyCode: 'KEY_T',
      keyText: 'T',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 3,
      keyCode: 'KEY_Y',
      keyText: 'Y',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 3,
      keyCode: 'KEY_U',
      keyText: 'U',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 3,
      keyCode: 'KEY_I',
      keyText: 'I',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 3,
      keyCode: 'KEY_O',
      keyText: 'O',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 3,
      keyCode: 'KEY_P',
      keyText: 'P',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 3,
      keyCode: 'KEY_BRACKET_LEFT',
      keyText: '[ {',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 3,
      keyCode: 'KEY_BRACKET_RIGHT',
      keyText: '] }',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 3,
      keyCode: 'KEY_BACK_SLASH',
      keyText: '\\ |',
      keyWidth: 0.06010505,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 4,
      keyCode: 'KEY_CAPS',
      keyText: 'caps lock',
      keyWidth: 0.07202205,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 4,
      keyCode: 'KEY_A',
      keyText: 'A',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 4,
      keyCode: 'KEY_S',
      keyText: 'S',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 4,
      keyCode: 'KEY_D',
      keyText: 'D',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 4,
      keyCode: 'KEY_F',
      keyText: 'F',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 4,
      keyCode: 'KEY_G',
      keyText: 'G',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 4,
      keyCode: 'KEY_H',
      keyText: 'H',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 4,
      keyCode: 'KEY_J',
      keyText: 'J',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 4,
      keyCode: 'KEY_K',
      keyText: 'K',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 4,
      keyCode: 'KEY_L',
      keyText: 'L',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 4,
      keyCode: 'KEY_COLON',
      keyText: '; :',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 4,
      keyCode: 'KEY_QUOTE',
      keyText: '\' "',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 4,
      keyCode: 'KEY_ENTER',
      keyText: 'enter',
      keyWidth: 0.09263212,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 5,
      keyCode: 'KEY_SHIFT_LEFT',
      keyText: 'shift',
      keyWidth: 0.09361081,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 5,
      keyCode: 'KEY_Z',
      keyText: 'Z',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 5,
      keyCode: 'KEY_X',
      keyText: 'X',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 5,
      keyCode: 'KEY_C',
      keyText: 'C',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 5,
      keyCode: 'KEY_V',
      keyText: 'V',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 5,
      keyCode: 'KEY_B',
      keyText: 'B',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 5,
      keyCode: 'KEY_N',
      keyText: 'N',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 5,
      keyCode: 'KEY_M',
      keyText: 'M',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 5,
      keyCode: 'KEY_COMMA',
      keyText: ', <',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 5,
      keyCode: 'KEY_PERIOD',
      keyText: '. >',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 5,
      keyCode: 'KEY_FORWARD_SLASH',
      keyText: '/ ?',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 5,
      keyCode: 'KEY_SHIFT_RIGHT',
      keyText: 'shift',
      keyWidth: 0.1142209,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 6,
      keyCode: 'KEY_CTRL_LEFT',
      keyText: 'ctrl',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 6,
      keyCode: 'KEY_FN',
      keyText: 'fn',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 6,
      keyCode: 'KEY_WIN',
      keyText: 'win',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 6,
      keyCode: 'KEY_ALT_LEFT',
      keyText: 'alt',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 6,
      keyCode: 'KEY_SPACEBAR',
      keyWidth: 0.2489037,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 6,
      keyCode: 'KEY_ALT_RIGHT',
      keyText: 'alt',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 6,
      keyCode: 'KEY_CTRL_RIGHT',
      keyText: 'ctrl',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 6,
      keyCode: 'KEY_ARROW_LEFT',
      keyText: '←',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 6,
      keyCode: 'KEY_ARROW_UP',
      keyText: '↑',
      keyWidth: 0.04778506,
      keyHeight: 0.0573403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 6,
      keyCode: 'KEY_ARROW_DOWN',
      keyText: '↓',
      keyWidth: 0.04778506,
      keyHeight: 0.0573403,
      keyRadius: 0.001594051,
    ),
    KeyModel(
      keyRow: 6,
      keyCode: 'KEY_ARROW_RIGHT',
      keyText: '→',
      keyWidth: 0.03914955,
      keyHeight: 0.1312806,
      keyRadius: 0.001594051,
    ),
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

  KeyModel getKey(String keyCode) {
    return _keys.firstWhere((element) => element.keyCode == keyCode);
  }
}
