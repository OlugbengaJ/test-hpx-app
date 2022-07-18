import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/profile_provider/profile_provider.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';

import 'package:hpx/utils/keyboard_controller.dart';
import 'package:hpx/widgets/components/layers.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
//
///[LayersProvider] to controle the layers state

class LayersProvider extends ChangeNotifier {
  final List<LayerItemModel> _layeritems = [];
  final List<LayerItemModel> _sublayers = [];
  ModeProvider? _modeProvider;
  ProfileProvider? _profileProvider; 
  bool isLayerEditing = false; // Used to check wether a layer is in edit mode
  int currentEditingID = 0; // if the ID is 0 then no layer is in edit mode
  int currentSublayerID = 0;

  /// if the currentSubLayerID is 0 that means there is no sublayer selected
  bool isSublayerSelected = false;
  bool shortcutAvalaible = false;
  bool creatingNewLayer = false;
  late LayerItemModel _currentSublayer;
  GlobalKey<FormFieldState>? editLayerKey;
  late KeyboardController physicalKeyboardController;
  BuildContext? _context;

  /// [hideDraggable] use to show or hide the stack layers for resizable widget
  bool hideDraggable = false;
  bool isLayerVisible = true;
  bool deleteLayerTooltip = false;

  /// [listIndex] use to the actual selected layer's index
  int _listIndex = 0;
  int get length => _layeritems.length;
  int get listIndex => _listIndex;
  ModeProvider? get modeProvider => _modeProvider;

  List<LayerItemModel> get layeritems => _layeritems; //.where((item) => item.profileID== _profileProvider!.currentProfile.id).toList(); // Should return only mainlayers
  List<LayerItemModel> get sublayerItems =>
      _sublayers; // Should return only sublayers

  LayersProvider() {
    physicalKeyboardController = KeyboardController(this);
  }


  bool layerProfile(LayerItemModel layerItemModel){
    if(layerItemModel.profileID==_profileProvider!.currentProfile.id){
      return true;
    }
    return false;
  }


  // Set build context
  setBuildContext(BuildContext context) {
    _context = context;
    notifyListeners();
  }


  List<LayerItemModel> getLayers(){
    for (var element in _layeritems) {
      print(element.layerText);
      print(element.id);
    }

    print("-------");

    return _layeritems.where((item) => item.profileID== _profileProvider!.currentProfile.id).toList();
  }


  // Use this to update layers when the profile changes
  getProfileLayers(){
    if(getLayers().isEmpty){
      LayerItemModel itemModel = LayerItemModel(
        id: getTheBiggestID(),
        profileID: _profileProvider!.currentProfile.id,
        layerText: 'Mood',
        icon: Icons.mood);

      add(itemModel);

      _modeProvider!.changeModeComponent(
        PickerModel(
            title: itemModel.mode!.name,
            value: itemModel.mode!.value,
            enabled: true,
            icon: itemModel.mode!.icon),
        _context!,
        false);
      //disableCreatingNewLayerMode();
      changeIndex(0);
    }

    debugPrint("${getLayers()}");

    for (var element in _layeritems) {
      debugPrint("Profile ID: ${element.profileID}");
    }

    notifyListeners();
  }

  /// retrieve [_currentSublayer] only if [isSublayerSelected] is true
  LayerItemModel? getCurrentSublayer() {
    if (isSublayerSelected) {
      return _currentSublayer;
    }
    return null;
  }

  

  /// [getItem] retrieve the layer using the index.
  /// This is to get the layer's informations
  LayerItemModel getItem(int i) {
    return layeritems[i];
  }

  /// [getItem] retrieve the layer using the index.
  /// This is to get the layer's informations
  LayerItemModel getItemByID(int id) {
    return _layeritems.singleWhere((layer) => layer.id == id);
  }

  getPresetKeys() {
    List<dynamic> listOfPresets = [
      {
        "name": "Copy",
        "keys": ["CTRL", "C"]
      },
      {
        "name": "Paste",
        "keys": ["CTRL", "V"]
      },
      {
        "name": "Open",
        "keys": ["CTRL", "O"]
      },
      {
        "name": "New File",
        "keys": ["CTRL", "N"]
      },
    ];

    return listOfPresets;
  }

  /// [toggleHideStackedLayers] toggle hide or show of the resizable
  void toggleHideStackedLayers(bool show) {
    hideDraggable = show;
    notifyListeners();
  }

  setEditingLayerKey(GlobalKey<FormFieldState> key, int layerID) {
    editLayerKey = key;
    currentEditingID = layerID;
    notifyListeners();
  }

  /// To check if the layer is the one on edit mode
  bool isTheCurrentLayerEditing(GlobalKey<FormFieldState> key) {
    if (editLayerKey == key) {
      return true;
    } else {
      return false;
    }
  }

  toggleEditMode(bool editing) {
    isLayerEditing = editing;
    notifyListeners();
  }

  saveEditingLayer() {
    if (editLayerKey!.currentState!.value.toString().isNotEmpty) {
      editLayerKey!.currentState!.save();
      if (currentEditingID != 0) {
        update(currentEditingID, editLayerKey!.currentState!.value.toString());
      }
    } else {
      update(currentEditingID, "$currentEditingID - No name");
    }
    isLayerEditing = false;
    notifyListeners();
  }

  /// [setModeProvider] to set the mode provider to use on layers
  void setModeProvider(ModeProvider modeProvider) {
    _modeProvider = modeProvider;
  }

  /// [setModeProvider] to set the mode provider to use on layers
  void setProfileProvider(ProfileProvider profileProvider) {
    _profileProvider = profileProvider;
  }

  /// listen to any change from the tools and effects so the current layers can be updated
  Future<void> toolsEffectsUpdated({bool modeChanged = false}) async {
    LayerItemModel item = getItem(listIndex);
    if (isSublayerSelected & !creatingNewLayer) {
      item = getCurrentSublayer()!;
    }
    var subLayers = getSublayers(item.id);

    /// check if there is already a layer with shortcut mode
    if (modeChanged &
        shortcutAvalaible &
        (_modeProvider!.getModeInformation().value == EnumModes.shortcut)) {
      layerAlertDialog(_context!);
    } else {
      if (_modeProvider!.getModeInformation().value == EnumModes.shortcut) {
        shortcutAvalaible = true;
      }
      // Check the if the current mode is shortcut colors
      if (item.mode!.value == EnumModes.shortcut) {
        if (_modeProvider!.getModeInformation().value != EnumModes.shortcut) {
          if (sublayerItems.isNotEmpty) {
            _sublayers.removeWhere((layer) => layer.parentID == item.id);
            notifyListeners();
          }
        }
      }

      if (!isSublayerSelected) {
        if (item.mode!.name != _modeProvider!.currentMode.name) {
          item.layerText = _modeProvider!.currentMode.name;
        }

        item.mode = _modeProvider!.getModeInformation();
        if (isSublayerSelected & !creatingNewLayer) {
          //_sublayers[listIndex] = item;
        } else {
          _layeritems[listIndex] = item;
        }

        if (item.mode!.value == EnumModes.shortcut) {
          if (subLayers.isEmpty) {
            duplicateOrCreatSubLayer(item, listIndex, _modeProvider!,
                sublayer: true);
          }
          // debugPrint('$subLayers');
        }
      } else {
        int index =
            _sublayers.indexWhere((item) => item.id == _currentSublayer.id);
        item = _currentSublayer;

        //debugPrint("${item.layerText}");
        item.mode = _modeProvider!.getModeInformation();
        item.shortcutColor =
            _modeProvider!.getModeInformation().currentColor[0];
        _sublayers[index] = item;
      }
    }

    shortcutAvalaible = false;
    for (var layer in layeritems) {
      if (layer.mode!.value == EnumModes.shortcut) {
        shortcutAvalaible = true;
        break;
      }
    }

    if (isSublayerSelected) {
      //changeToolsEffectMode(getItemByID(item.parentID).mode!);
      int parentIndex =
          _layeritems.indexWhere((layer) => layer.id == item.parentID);
      //changeIndex(parentIndex);
    }

    physicalKeyboardController.addLayer(item);
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

  disableCreatingNewLayerMode() {
    creatingNewLayer = false;
    notifyListeners();
  }

  /// Add a new layer. By default new added layers use the mood mode
  void add(LayerItemModel item) {
    creatingNewLayer = true;
    isSublayerSelected = false;
    ToolsModeModel mode = ToolsModeModel(
        currentColor: moodThemesList.first.colorCode,
        effects: EffectsModel(effectName: EnumModes.mood),
        name: "Mood",
        value: EnumModes.mood,
        modeType: EnumModeType.layers,
        icon: Icons.mood);

    item.mode = mode;

    for (var element in _layeritems) {
      element.listDisplayColor = Colors.grey;
    }

    toggleHideStackedLayers(!item.visible);

    _layeritems.insert(0, item);

    physicalKeyboardController.addLayer(item);
    notifyListeners();
  }

  /// [duplicateOrCreatSubLayer] uses to duplicate the layer or create a sublayer depending the mode type
  void duplicateOrCreatSubLayer(
      LayerItemModel item, int index, ModeProvider modeProvider,
      {bool sublayer = false}) {
    LayerItemModel duplicatedItem = LayerItemModel(
      id: (sublayer) ? getTheBiggestSubID() : getTheBiggestID(),
      profileID: _profileProvider!.currentProfile.id,
      layerText: "Copy ${item.layerText}",
      isSublayer: sublayer,
    );

    duplicatedItem.mode = item.mode;

    for (var element in _sublayers) {
      element.listDisplayColor = Colors.grey;
    }

    if (sublayer) {
      modeProvider.setModeType(true);
      item.hasSublayer = true;
      duplicatedItem.layerText = "Sublayer";
      duplicatedItem.parentID = item.id;
      duplicatedItem.isSublayer = true;
      duplicatedItem.mode = modeProvider.getModeInformation();
      _sublayers.insert(0, duplicatedItem);
      _layeritems[index] = item;
    } else {
      for (var element in _layeritems) {
        element.listDisplayColor = Colors.grey;
      }
      _layeritems.insert(index + 1, duplicatedItem);
      physicalKeyboardController.addLayer(duplicatedItem);
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
    //_layeritems[_listIndex] = item;

    if (item.mode!.value == EnumModes.shortcut) {
      //_modeProvider!.setModeType(true);
    }
    changeToolsEffectMode(item.mode!);
    toggleHideStackedLayers(!item.visible);
    isSublayerSelected = false;
    notifyListeners();
  }

  void changeSublayerIndex(int subIndex) {
    for (var element in _layeritems) {
      element.listDisplayColor = Colors.grey;
    }

    for (var element in _sublayers) {
      element.listDisplayColor = Colors.grey;
    }

    _modeProvider!.setModeType(true);
    LayerItemModel sublayer = _sublayers[subIndex];
    sublayer.listDisplayColor = Colors.white;
    sublayer.visible = true;
    _currentSublayer = sublayer;
    //LayerItemModel parentModel = getItemByID(sublayer.parentID);
    //parentModel.mode = sublayer.mode;
    isSublayerSelected = true;
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

  /// [toggleVisibility] toggle visiblity for a layers
  void toggleVisibility(LayerItemModel item, int index) {
    item.listDisplayColor = Colors.grey;
    if (item.visible) {
      item.listDisplayColor = Colors.white;
    }

    _layeritems[index] = item;

    toggleHideStackedLayers(!item.visible);
    notifyListeners();
  }

  /// [toggleVisibility] toggle visiblity for a layers
  void toggleSublayerVisibility(LayerItemModel item, int index) {
    item.listDisplayColor = Colors.grey;

    if (item.visible) {
      item.listDisplayColor = Colors.white;
    }

    _sublayers[index] = item;

    notifyListeners();
  }

  /// [reorder] is called to rearrange layers
  void reorder(int oldIndex, int newIndex) {
    /// Save any editing layer before rearrange
    if (isLayerEditing) {
      saveEditingLayer();
    }
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = _layeritems.removeAt(oldIndex);
    _layeritems.insert(newIndex, item);
    notifyListeners();
  }

  /// [removeItem] is used to remove a layer from the [layeritems]
  void removeItem(int index) {
    /// Save any editing layer before delete
    if (isLayerEditing) {
      saveEditingLayer();
    }

    /// Still check if there is no editing layer
    if (!isLayerEditing) {
      if (length > 1) {
        final item = _layeritems[index];

        _layeritems.remove(item);
        physicalKeyboardController.removeLayer(item);

        if (_layeritems.isNotEmpty) {
          changeIndex(0);
        }
      }
    }

    shortcutAvalaible = false;
    for (var layer in layeritems) {
      if (layer.mode!.value == EnumModes.shortcut) {
        shortcutAvalaible = true;
        break;
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

  setEditingSubLayerKey(GlobalKey<FormFieldState> key, int layerID) {
    editLayerKey = key;
    currentEditingID = layerID;
    notifyListeners();
  }

  /// To check if the layer is the one on edit mode
  bool isTheCurrentSubLayerEditing(GlobalKey<FormFieldState> key) {
    if (editLayerKey == key) {
      return true;
    } else {
      return false;
    }
  }

  toggleSubEditMode(bool editing) {
    isLayerEditing = editing;
    notifyListeners();
  }

  void updateSublayerWithID(int id, String text) {
    LayerItemModel item = sublayerItems.singleWhere((item) => item.id == id);
    updateSublayer(item, text);
    notifyListeners();
  }

  saveEditingSubLayer() {
    if (editLayerKey!.currentState!.value.toString().isNotEmpty) {
      //editLayerKey!.currentState!.save();
      if (currentEditingID != 0) {
        updateSublayerWithID(
            currentEditingID, editLayerKey!.currentState!.value.toString());
      }
    } else {
      updateSublayerWithID(
          currentEditingID, "$currentEditingID -Sub layer No name");
    }
    notifyListeners();
  }

  /// Update a sublayer text
  void updateSublayer(LayerItemModel item, String value) {
    for (var subItem in sublayerItems) {
      if (item.id == subItem.id) {
        if (value.isNotEmpty) {
          subItem.layerText = value;
        } else {
          subItem.layerText = "$currentEditingID -Sub layer No name";
        }
      }
    }
    isLayerEditing = false;
    notifyListeners();
  }

  void changeToolsEffectMode(ToolsModeModel mode) {
    _modeProvider!.setModeType(true);
    _modeProvider!.setCurrentMode(mode);

    _modeProvider!.changeModeComponent(
        PickerModel(
            title: mode.name,
            value: mode.value,
            enabled: true,
            icon: mode.icon),
        _context!,
        true);
  }
}
