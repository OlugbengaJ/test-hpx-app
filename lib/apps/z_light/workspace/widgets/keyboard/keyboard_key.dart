import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/key_rrect.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/key_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:provider/provider.dart';

class KeyboardKey extends StatelessWidget {
  /// [KeyboardKey] draws a key based on [KeyModel] specification.
  ///
  /// Zoom scale impacts the size of the key.
  const KeyboardKey({
    Key? key,
    this.onTapHandler,
    required this.zoomScale,
  }) : super(key: key);

  /// [onTapHandler] callback function for the key.
  final VoidCallback? onTapHandler;

  /// [zoomScale] is a zoom factor to scale the key size.
  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    // Gets access to the widget's position (offset) in the widget tree.
    final box = context.findRenderObject() as RenderBox?;
    final layersProvider = Provider.of<LayersProvider>(context);

    return Stack(
      children: [
        Material(
          color: Colors.transparent,
          child: Consumer<WorkspaceProvider>(
            builder: (context, workspaceProvider, child) {
              return InkWell(
                onTap: onTapHandler,

                // listens to key changes and allows updating this key instance
                child: Consumer<KeyModel>(
                  builder: (context, keyModel, child) => KeyRRect(
                    keyModel: _updateKeyInfo(
                      workspaceProvider,
                      layersProvider,
                      keyModel,
                      box,
                    ),
                    zoomScale: zoomScale,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// [_updateKeyInfo]
///
/// Helper function to update the key properties.
KeyModel _updateKeyInfo(
  WorkspaceProvider provider,
  LayersProvider layersProvider,
  KeyModel keyModel,
  RenderBox? renderBox,
) {
  final layers = layersProvider.layeritems;
  final layerIndex = layersProvider.listIndex;

  // clear key selections
  final keyChipKeys = keyModel.getLayeredChips();
  if (keyChipKeys.isNotEmpty) {
    List<KeyPaintChip> krect = [];
    // key has existing chips; preserve their properties
    for (var l in layers) {
      final c = keyModel.getChip(l.id.toString());
      if (c != null) {
        krect.add(c);
      }
    }

    // remove all chip layers in key
    for (var k in keyChipKeys) {
      keyModel.removeChip(k);
    }

    final currentId = layers[layerIndex].id.toString();
    // add new chip layers in reverse order
    for (var i = krect.length - 1; i >= 0; i--) {
      final chip = krect[i] as KeyPaintRect;

      if (currentId == chip.chipKey) {
        chip.color = layers[layerIndex].mode?.currentColor.last;
      }

      debugPrint(
          'currentId $currentId $i ${chip.chipKey} ${layers[i].mode?.currentColor}');
      keyModel.addChip(chip.chipKey, chip);
    }
  }

  if (keyModel.keyCode.toString().contains('kEsc')) {
    for (var i = 0; i < layers.length; i++) {
      debugPrint('\t esc $i ${layers[i].mode?.currentColor.first}');
    }

    debugPrint(
        '${keyModel.keyCode} \t layerIndex $layerIndex \t ${keyModel.chipsValues.map((e) => e.chipKey)}');
  }
  // update if previously selected

  final isWidgetInZone =
      provider.isWidgetInZone(renderBox, k: keyModel.keyCode.toString());
  bool layerVisible = false;
  double opacity = 1.0;
  // provider.animation.value;

  if (layersProvider.layeritems.isNotEmpty) {
    final layer = layersProvider.layeritems[layerIndex];
    layerVisible = layer.visible;
    // keyModel.highlightColor = layer.mode?.currentColor.first;

    switch (layer.mode?.value) {
      case EnumModes.mood:
        // provider.stopAnimating();

        // show full opacity
        opacity = 1.0;
        break;
      default:
    }
  }

  keyModel.selectKey(isWidgetInZone, layerIndex, layerVisible,
      opacity: opacity, currentLayers: layers);

  if (keyModel.keyCode.toString().contains('kEsc')) {
    debugPrint(
        '${keyModel.keyCode} \t layerIndex $layerIndex \t ${keyModel.chipsValues.map((e) => e.chipKey)}');
  }

  // if (provider.isDragModeClick &&
  //     isWidgetInZone == true &&
  //     !keyModel.isSelected) {
  //   keyModel.selectKey(isWidgetInZone);
  // } else if (provider.isDragModeClick &&
  //     isWidgetInZone == true &&
  //     keyModel.isSelected) {
  //   keyModel.unSelectKey();
  // }

  return keyModel;
}
