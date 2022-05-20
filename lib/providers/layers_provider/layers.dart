import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpx/apps/z_light/layers/resizable/provider/resizable.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';



class LayersProvider extends ChangeNotifier {
  final areaHeight = Get.height * 0.70;
  final areaWidth = Get.width * 0.70;
  final List<LayerItemModel> _layeritems = [];
  final List<LayerItemModel> _sublayers = [];

  bool hideStackedLayers = false;
  bool deleteLayerTooltip = false;

  int _index = 0;
  int _listIndex = 0;
  int get length => _layeritems.length;
  int get index => _index;
  int get listIndex => _listIndex;

  List<LayerItemModel> get layeritems => _layeritems; // Should return only mainlayers
  List<LayerItemModel> get sublayerItems => _sublayers; // Should return only sublayers
  

  LayerItemModel getItem(int i) {
    return _layeritems[i];
  }


  void setKeys(keys){
    LayerItemModel item = _layeritems[index];
    item.setKeys(keys);
    layeritems[index] = item;

    notifyListeners();
  }

  LayerItemModel getEditingLayer() {
    if(length>1){
      return _layeritems[index];
    }else{
      return _layeritems[0];
    }    
  }

  void toggleHideStackedLayers(bool show) {
    hideStackedLayers = show;
  }

  void updateView(double newTop, double newBottom, double newLeft, double newRight) {
    var item = layeritems[listIndex];
    item.top = newTop;
    item.bottom = newBottom;
    item.left = newLeft;
    item.right = newRight;
    _layeritems[listIndex] = item;
    
    notifyListeners();
  }


  int getTheBiggestID() {
    int id = 1;
    for (var item in _layeritems) {
      if (id <= item.id) {
        id = item.id;
      }
    }
    return id + 1;
  }

  int getTheBiggestSUbID() {
    int id = 1;
    for (var item in _sublayers) {
      if (id <= item.id) {
        id = item.id;
      }
    }
    return id + 1;
  }

  List<LayerItemModel> getSublayers(int id){
    List<LayerItemModel> layers = [];
    for(var item in sublayerItems){
      if(item.parentID==id){
        layers.add(item);
      }
    }
    return layers;
  }

  void add(LayerItemModel item) {
    for (var element in _layeritems) {
      element.listDisplayColor = Colors.grey;
    }

    //item.paintColor = colors[item.id - 1];

    _layeritems.insert(0, item);


    notifyListeners();
  }


  void duplicate(LayerItemModel item, int index, {bool sublayer=false}) {
    

    LayerItemModel duplicatedItem = LayerItemModel(
      id: (sublayer)? getTheBiggestSUbID(): getTheBiggestID(),
      layerText: "Copy ${item.layerText}",
      mode: item.mode,
      isSublayer: sublayer,
    );

    if(sublayer){
      item.hasSublayer = true;
      duplicatedItem.layerText = "Sublayer";
      duplicatedItem.parentID = item.id;
      _sublayers.insert(0, duplicatedItem);
      _layeritems[index] = item;
    }
    else{
      for (var element in _layeritems) {
        element.listDisplayColor = Colors.grey;
      }
      _layeritems.insert(index + 1, duplicatedItem);
      
    }
    notifyListeners();
  }

  void changeIndex(int index) {
    for (var element in _layeritems) {
      element.listDisplayColor = Colors.grey;
    }
    

    _listIndex = index;
    
    final item = _layeritems[_listIndex];
    item.listDisplayColor = Colors.white;
    _layeritems[_listIndex] = item;


    notifyListeners();
  }

  void update(LayerItemModel item, int index) {
    int toEdit = _layeritems[index].id;

      _layeritems[index] = item;

    notifyListeners();
  }

  void updateSublayer(LayerItemModel item, String value) {
    for (var subItem in sublayerItems) {
      if(item.id==subItem.id){
        subItem.layerText = value;
      }
    }
    notifyListeners();
  }

  void toggleVisibility(LayerItemModel item, int index) {
    int toEdit = _layeritems[index].id;
    int stackedIndex = 0; // The stack index is different from the list index

    item.listDisplayColor = Colors.grey;

    if (item.visible) {
      item.listDisplayColor = Colors.white;
    }

    _layeritems[index] = item;

    
    notifyListeners();
  }

  void reorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = _layeritems.removeAt(oldIndex);
    _layeritems.insert(newIndex, item);
    notifyListeners();
  }

  void removeItem(int index) {
    if(length>1){
      final item = _layeritems[index];
    
      _layeritems.remove(item);
      

      

      if (_layeritems.isNotEmpty) {
        changeIndex(0);
      }
    }

    notifyListeners();
  }

  void removeSubItem(item) {
    if(sublayerItems.length>1){
      sublayerItems.remove(item);
    }

    notifyListeners();
  }


  void setResizablePosition(ResizableProvider provider){
    final item = _layeritems[_listIndex];
    provider.setSize(
      newBottom: item.bottom,
      newLeft: item.left,
      newRight: item.right,
      newTop: item.top,
    );

    notifyListeners();
  }
}
