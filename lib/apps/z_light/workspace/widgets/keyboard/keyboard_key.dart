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
                child: AnimatedBuilder(
                  animation: workspaceProvider.controller,
                  builder: (context, child) => Consumer<KeyModel>(
                    builder: (context, keyModel, child) => KeyRRect(
                      animation: workspaceProvider.controller,
                      keyModel: _updateKeyInfo(
                        workspaceProvider,
                        layersProvider,
                        keyModel,
                        box,
                      ),
                      zoomScale: zoomScale,
                    ),
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
/// Helper function to update the key's properties.
KeyModel _updateKeyInfo(
  WorkspaceProvider provider,
  LayersProvider layersProvider,
  KeyModel keyModel,
  RenderBox? renderBox,
) {
  final layers = layersProvider.layeritems;
  final layerIndex = layersProvider.listIndex;

  bool? isBoxZoned;

  // holds the existing layer chips that are remain selected.
  List<KeyPaintChip> krect = [];

  // clear key selections
  final layersChipKeys = keyModel.getLayeredChips();

  if (layersChipKeys.isNotEmpty) {
    // TODO: using workspace provider layers selection map could be useful.

    // check if the key is selected for each layer, then paint if true
    // key has existing chips; preserve their properties
    // for (var l in layers) {
    for (var k in layersChipKeys) {
      final chip = keyModel.getChip(k.toString());

      // preserve only zoned keys
      if (chip != null) krect.add(chip);
    }

    // remove all chip layers in key
    for (var k in layersChipKeys) {
      keyModel.removeChip(k);
    }
  }

  if (layers.isNotEmpty) {
    // add new chip layers in reverse order
    // get the current index id as we need to update its properties
    final currentLayer = layers[layerIndex];

    for (var i = layers.length - 1; i >= 0; i--) {
      final layer = layers[i];
      final layerId = layer.id;

      isBoxZoned =
          provider.isBoxZoned(renderBox, layerId, k: '${keyModel.keyCode}');

      if (isBoxZoned == true && layer.visible) {
        // insert new chip with the layer id as key
        final chip = KeyPaintRect('$layerId');

        if ('${currentLayer.id}' == chip.chipKey) {
          // use the default color for current layer
          chip.color = currentLayer.mode?.currentColor.last;
        } else {
          // use existing color for non-current layer
          final foundKeys = krect.where((e) => e.chipKey == chip.chipKey);
          if (foundKeys.isNotEmpty) {
            chip.color = foundKeys.first.color;
          }
        }

        // get the current chip in layers
        switch (layer.mode?.value) {
          case EnumModes.blinking:
            final beginColor = layer.mode?.currentColor.first;
            final endColor = layer.mode?.currentColor.last;
            final animColor = provider.animColor(beginColor, endColor,
                speed: layer.mode?.effects.speed);

            // if (keyModel.keyCode.name.contains('k5')) {
            //   debugPrint(
            //       'anim colors ${layer.mode?.currentColor.length} ${animColor?.value} ${layer.mode?.currentColor.first} ${layer.mode?.currentColor.last}');
            // }

            chip.color = animColor!;
            chip.opacity = 1;
            break;
          case EnumModes.breathing:
            final beginColor = layer.mode?.currentColor.first;
            final endColor = layer.mode?.currentColor.last;
            final animColor = provider.animColor(beginColor, endColor,
                speed: layer.mode?.effects.speed);

            chip.color = animColor!;
            chip.opacity = 1;
            break;
          case EnumModes.image:
            // get the row and column of this key and use the matching
            // coordinate from the matrix.
            debugPrint(
                'images ${layer.mode?.effects.extractedColors?.map((e) => e)}');
            break;
          default:
            chip.opacity = 1;
        }
        // debugPrint('current mode name ${layer.mode?.value}');

        // add the chip
        keyModel.addChip(chip);
      }
    }

    // TODO: only for debugging, delete.
    // if ('${keyModel.keyCode}'.contains('kF5')) {
    //   // for (var i = 0; i < layers.length; i++) {
    //   //   debugPrint('\t esc $i ${layers[i].mode?.currentColor.first}');
    //   // }

    //   // debugPrint('kF5 \t ${keyModel.chipsValues.map((e) => e.chipKey)}');
    // }
  }

  return keyModel;
}
