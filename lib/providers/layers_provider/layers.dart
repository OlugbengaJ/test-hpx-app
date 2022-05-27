import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/resizable/provider/resizable.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';

///[LayersProvider] to controle the layers state

class LayersProvider extends ChangeNotifier {
  final List<LayerItemModel> _layeritems = [];
  final List<LayerItemModel> _sublayers = [];
  ModeProvider? _modeProvider;

  /// [hideStackedLayers] use to show or hide the stack layers for resizable widget
  bool hideStackedLayers = false;
  bool isLayerVisible = true;
  bool deleteLayerTooltip = false;

  /// [listIndex] use to the actual selected layer's index
  int _listIndex = 0;
  int get length => _layeritems.length;
  int get listIndex => _listIndex;

  List<LayerItemModel> get layeritems =>
      _layeritems; // Should return only mainlayers
  List<LayerItemModel> get sublayerItems =>
      _sublayers; // Should return only sublayers

  /// [getItem] retrieve the layer using the index.
  /// This is to get the layer's informations
  LayerItemModel getItem(int i) {
    return _layeritems[i];
  }


  /// [toggleHideStackedLayers] toggle hide or show of the resizable
  void toggleHideStackedLayers(bool show) {
    hideStackedLayers = show;
  }


  void setModeProvider(ModeProvider modeProvider){
    _modeProvider = modeProvider;
  }


  /// listen to any change from the tools and effects so the current layers can be updated
  void toolsEffectsUpdated(){
    LayerItemModel item = getItem(listIndex);
    item.mode =  _modeProvider!.getModeInformation();
    _layeritems[listIndex] = item;
    notifyListeners();
  }


  /// [updateView] use to update the item position when the resizable-draggable stop dragging
  /// This method is called from the [ResizableProvider]
  void updateView(
      double newTop, double newBottom, double newLeft, double newRight) {
    var item = layeritems[listIndex];
    item.top = newTop;
    item.bottom = newBottom;
    item.left = newLeft;
    item.right = newRight;
    _layeritems[listIndex] = item;

    notifyListeners();
  }


  /// [getTheBiggestID] get the layers biggest ID
  /// When a new layer, its ID is suppose to be unique and the biggest ID in the list. 
  int getTheBiggestID() {
    int id = 1;
    for (var item in _layeritems) {
      if (id <= item.id) {
        id = item.id;
      }
    }
    return id + 1;
  }

  /// [getTheBiggestSubID] get the sublayers biggest ID
  /// When a new sublayer, its ID is suppose to be unique and the biggest ID in the list. 
  int getTheBiggestSubID() {
    int id = 1;
    for (var item in _sublayers) {
      if (id <= item.id) {
        id = item.id;
      }
    }
    return id + 1;
  }


  /// [getSublayers], retrieve sublayers for a specific layer using the parentID.
  /// The function filters through [sublayerItems]
  List<LayerItemModel> getSublayers(int id) {
    List<LayerItemModel> layers = [];
    for (var item in sublayerItems) {
      if (item.parentID == id) {
        layers.add(item);
      }
    }
    return layers;
  }


  /// Add a new layer. By default new added layers use the mood mode
  void add(LayerItemModel item) {
    //print(modeProvider!.currentMode.value);
    ToolsModeModel mode = ToolsModeModel(
      currentColor: moodThemesList.first.colorCode,
      effects: EffectsModel(effectName: EnumModes.mood),
      name: "Mood",
      value: EnumModes.mood,
      modeType: EnumModeType.layers,
      icon: Icons.mood
    );
    
      item.mode = mode;

    for (var element in _layeritems) {
      element.listDisplayColor = Colors.grey;
    }

    _layeritems.insert(0, item);

    notifyListeners();
  }

  /// [duplicateOrCreatSubLayer] uses to duplicate the layer or create a sublayer depending the mode type
  void duplicateOrCreatSubLayer(LayerItemModel item, int index, ModeProvider modeProvider,{bool sublayer=false}) {
    LayerItemModel duplicatedItem = LayerItemModel(
      id: (sublayer) ? getTheBiggestSubID() : getTheBiggestID(),
      layerText: "Copy ${item.layerText}",
      isSublayer: sublayer,
    );

    duplicatedItem.mode = item.mode;

    if(sublayer){
      modeProvider.setModeType(true);
      item.hasSublayer = true;
      duplicatedItem.layerText = "Sublayer";
      duplicatedItem.parentID = item.id;
      duplicatedItem.mode = modeProvider.getModeInformation();
      _sublayers.insert(0, duplicatedItem);
      _layeritems[index] = item;
    } else {
      for (var element in _layeritems) {
        element.listDisplayColor = Colors.grey;
      }
      _layeritems.insert(index + 1, duplicatedItem);
    }
    notifyListeners();
  }

  /// [changeIndex] set index when tap on the layer in the [_layeritems]
  void changeIndex(int index) {
    for (var element in _layeritems) {
      element.listDisplayColor = Colors.grey;
    }

    _listIndex = index;

    final item = _layeritems[_listIndex];
    item.listDisplayColor = Colors.white;
    _layeritems[_listIndex] = item;
    print(item.visible);

    notifyListeners();
  }

  /// Update the layerText using its ID
  void update(int id, String text) {
    LayerItemModel item = layeritems.singleWhere((item) => item.id == id);
    item.layerText = text;
    int editingIndex = layeritems.indexWhere((item) => item.id == id);
    _layeritems[editingIndex] = item;
    notifyListeners();
  }


  /// Update a sublayer text
  void updateSublayer(LayerItemModel item, String value) {
    for (var subItem in sublayerItems) {
      if (item.id == subItem.id) {
        subItem.layerText = value;
      }
    }
    notifyListeners();
  }


  /// [toggleVisibility] toggle visiblity for a layers
  void toggleVisibility(LayerItemModel item, int index) {
    print("Toggle visibility");
    item.listDisplayColor = Colors.grey;

    if (item.visible) {
      item.listDisplayColor = Colors.white;
    }

    _layeritems[index] = item;

    notifyListeners();
  }


  /// [reorder] is called to rearrange layers
  void reorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = _layeritems.removeAt(oldIndex);
    _layeritems.insert(newIndex, item);
    notifyListeners();
  }


  /// [removeItem] is used to remove a layer from the [layeritems]
  void removeItem(int index) {
    if (length > 1) {
      final item = _layeritems[index];
    
      _layeritems.remove(item);

      if (_layeritems.isNotEmpty) {
        changeIndex(0);
      }
    }

    notifyListeners();
  }


  /// [removeSubItem] is used to remove a layer from the [sublayerItems]
  void removeSubItem(item) {
    if (sublayerItems.length > 1) {
      sublayerItems.remove(item);
    }

    notifyListeners();
  }


  /// [setResizablePosition] this function call the [ResizableProvider] to set the resizable position anytime the index.
  /// There is no need to have multiple resizable anymore. Use only one for all the layers
  void setResizablePosition(ResizableProvider provider) {
    final item = _layeritems[_listIndex];
    isLayerVisible = item.visible;
    if (item.top != 0) {
      provider.setSize(
        newBottom: item.bottom,
        newLeft: item.left,
        newRight: item.right,
        newTop: item.top,
      );
    }
    provider.setSize();
    

    notifyListeners();
  }
}
