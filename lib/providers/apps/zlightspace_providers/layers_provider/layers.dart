import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpx/models/layers/layer_item_model.dart';

import '../../../../apps/z_light/layers/widgets/resizable_widget_controller.dart';

List<Color> colors = const [
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Color.fromARGB(255, 14, 13, 11),
  Color.fromARGB(255, 94, 85, 9),
  Colors.yellow,
  Colors.yellow,
];

class LayersProvider extends ChangeNotifier {
  final areaHeight = Get.height * 0.70;
  final areaWidth = Get.width * 0.70;
  final List<LayerItemModel> _layeritems = [
  ];
  final List<LayerItemModel> _stackedLayeritems = []; // Used to display the staked layers
  bool hideStackedLayers = false;
  
  int _index = 0;
  int get length => _layeritems.length;
  int get index =>  _index;

  List<LayerItemModel> get layeritems => _layeritems;
  List<LayerItemModel> get stackedLayeritems => _stackedLayeritems;

  LayerItemModel getItem(int index) {
    return _layeritems[index];
  }

  void toggleHideStackedLayers(bool show){
    hideStackedLayers = show;
  }

  void updateView(){
    notifyListeners();
  }


  int getTheBiggestID(){
    int id = 1;
    for (var item in _layeritems) {
      if(id<=item.id){
        id = item.id;
      }
    }
    return id+1;
  }



  void add(LayerItemModel item) {
    for (var element in _layeritems) {
      element.listDisplayColor = Colors.grey;
    }

    item.paintColor = colors[item.id - 1];

    _layeritems.insert(0, item);
    _stackedLayeritems.add(item);

    _index = _stackedLayeritems.length - 1;

    notifyListeners();
  }


  void rearranegStack(){
    // Not working properly
    stackedLayeritems.clear();
    List<LayerItemModel> reversedList = layeritems.reversed.toList();
    for (var item in reversedList) {
      stackedLayeritems.add(item);
    }
    notifyListeners();
  }


  void duplicate(LayerItemModel item, index) {
    for (var element in _layeritems) {
      element.listDisplayColor = Colors.grey;
    }

    ResizableWidgetController controller = ResizableWidgetController(
      initialPosition: item.controller.initialPosition,
      areaHeight: item.controller.areaHeight,
      areaWidth: item.controller.areaWidth,
      height: item.controller.height,
      width: item.controller.width,
      minWidth: item.controller.minWidth,
      minHeight: item.controller.minHeight,
    );

    controller.bottom = item.controller.bottom;
    controller.top = item.controller.top;
    controller.left = item.controller.left;
    controller.right = item.controller.right;
    controller.height = item.controller.height;
    controller.width = item.controller.width;

    LayerItemModel duplicatedItem = LayerItemModel(
      id: getTheBiggestID(),
      layerText: "Copy ${item.layerText}", 
      controller: controller
    );

    

    _layeritems.insert(index + 1, duplicatedItem);
    _stackedLayeritems.add(duplicatedItem);

    _index = _stackedLayeritems.length - 1;

    notifyListeners();
  }
  
  

  void changeIndex(int index){
    for (var element in _layeritems) {
      element.listDisplayColor = Colors.grey;
    }
    final item =  _layeritems[index];
    item.listDisplayColor = Colors.white;
    _layeritems[index] = item;
    for( var i = 0 ; i < _stackedLayeritems.length; i++ ) { 
      if(_stackedLayeritems[i].id==_layeritems[index].id){
        _index = i;
        break;
      }
    }
    notifyListeners();
  }

  void update(LayerItemModel item, int index) {
    int toEdit = _layeritems[index].id;
    int stackedIndex = 0; // The stack index is different from the list index

    _layeritems[index] = item;

    for( var i = 0 ; i < _layeritems.length; i++ ) {
        if(_stackedLayeritems[i].id==toEdit){
          stackedIndex = i;
        }
    }

    _stackedLayeritems[stackedIndex] = item;

    notifyListeners();
  }


  void toggleVisibility(LayerItemModel item, int index) {
    int toEdit = _layeritems[index].id;
    int stackedIndex = 0; // The stack index is different from the list index

    item.listDisplayColor = Colors.grey;

    if(item.visible){
      item.listDisplayColor = Colors.white;
    }

    _layeritems[index] = item;

    for( var i = 0 ; i < _layeritems.length; i++ ) {
      if(_stackedLayeritems[i].id==toEdit){
        stackedIndex = i;
        break;
      }
    }

    _stackedLayeritems[stackedIndex] = item;
    notifyListeners();
  }

  void reorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = _layeritems.removeAt(oldIndex);
    _layeritems.insert(newIndex, item);
    rearranegStack();
    notifyListeners();
  }

  void removeItem(int index) {
    final item = _layeritems[index];
    int stackedIndex = 0;

    for( var i = 0 ; i < _layeritems.length; i++ ) { 
      if(_stackedLayeritems[i].id==_layeritems[index].id){
        stackedIndex = i;
        break;
      }
    }

    item.visibleOnStack = false;
    _stackedLayeritems[stackedIndex] = item;
    _layeritems.remove(item);

    
    if(_layeritems.isNotEmpty){
      changeIndex(0);
    }else{
      stackedLayeritems.clear();
    }

    notifyListeners();
  }


}
