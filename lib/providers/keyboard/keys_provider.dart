import 'package:flutter/material.dart';

/// Keys to watch by the ZoneSelector and the resizable widgets
class KeySelectorProvider extends ChangeNotifier {
  final List<GlobalKey> _keysToWatch = [];
  List<GlobalKey> get keysTowatch => _keysToWatch;
  bool keySelectorDisplayed = false;

  GlobalKey addKey(GlobalKey key) {
    _keysToWatch.add(key);
    return key;
  }

  void clearKeys() {
    _keysToWatch.clear();
    notifyListeners();
  }

  void toggleKeySelector(bool display) {
    keySelectorDisplayed = display;
    clearKeys();
    notifyListeners();
  }
}
