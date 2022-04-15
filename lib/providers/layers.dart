import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hpx/models/layers/layer_item_model.dart';

class LayersProvider extends ChangeNotifier {
  final List<LayerItemModel> _layeritems = [];
  int get lenght => _layeritems.length;
  void add(LayerItemModel item) {
    _layeritems.add(item);
    notifyListeners();
  }

  LayerItemModel getItem(int index) {
    return _layeritems[index];
  }

  void update(LayerItemModel item, int index) {
    _layeritems[index] = item;
  }

  void reorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = _layeritems.removeAt(oldIndex);
    log(["layerID:", item.id.toString(), ':New Index:', newIndex].toString());
    _layeritems.insert(newIndex, item);
    log(_layeritems[newIndex].id.toString());
    notifyListeners();
  }

  void removeItem(int index) {
    _layeritems.removeAt(index);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
