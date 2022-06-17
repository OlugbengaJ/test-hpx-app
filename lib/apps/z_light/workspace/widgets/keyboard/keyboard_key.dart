import 'dart:math' as math;

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

  // holds the existing layer chips that are remain selected.
  List<KeyPaintChip> krect = [];

  // clear key selections
  final layersChipKeys = keyModel.getLayeredChipsKeys();

  if (layersChipKeys.isNotEmpty) {
    // TODO: using workspace provider layers selection map could be useful.

    // check if the key is selected for each layer, then paint if true
    // key has existing chips; preserve their properties
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

      final boxZone = provider.boxZone(renderBox, layerId);

      // clear the layer keys info
      layer.setKeys([]);

      if (boxZone != null) {
        // insert new chip with the layer id as key
        final chip = KeyPaintRect('$layerId');

        if ('${currentLayer.id}' == chip.chipKey) {
          // use the default color for current layer
          chip.color = currentLayer.mode?.currentColor.last;
          chip.showOutline = true;
        } else {
          // use existing color for non-current layer
          final foundKeys = krect.where((e) => e.chipKey == chip.chipKey);
          if (foundKeys.isNotEmpty) {
            chip.color = foundKeys.first.color;
            chip.showOutline = false;
          }
        }

        // get the current chip in layers
        switch (layer.mode?.value) {
          case EnumModes.blinking:
          case EnumModes.breathing:
            final beginColor = layer.mode?.currentColor.first;
            final endColor = layer.mode?.currentColor.last;
            final animColor = provider.animColor(
              beginColor,
              endColor,
              effect: layer.mode?.value,
              speed: layer.mode?.effects.speed,
            );

            chip.color = animColor!;
            break;
          case EnumModes.colorcycle:
            final animColor = provider.animColorTween(
                layer.mode?.currentColor as List<Color>,
                speed: layer.mode?.effects.speed);

            chip.color = animColor!;
            break;
          case EnumModes.wave:
            debugPrint('${layer.mode?.currentColor.map((e) => e)}');
            break;
          case EnumModes.image:
            // paint all keys based on color matrix (m x n)

            // get column (n) values where row (m) matches key row index.
            final colorsMatrix = layer.mode?.effects.extractedColors;

            if (colorsMatrix != null && colorsMatrix.isNotEmpty) {
              final rowIndex = getColorIndex(
                boxZone.selectorRect.height,
                boxZone.selectorRect.top,
                boxZone.boxRect.top,
                colorsMatrix.length,
              );

              final rowColors = colorsMatrix[rowIndex];
              final colIndex = getColorIndex(
                boxZone.selectorRect.width,
                boxZone.selectorRect.left,
                boxZone.boxRect.left,
                rowColors.length,
              );

              try {
                chip.color = rowColors[colIndex];
              } catch (e) {
                // color cast failed.
              }
            }
            break;
          default:
        }

        chip.opacity = layer.visible ? 1 : 0;
        layer.addKey(keyModel);

        // add the chip
        keyModel.addChip(chip);
      }
    }
  }

  return keyModel;
}

/// [getColorIndex] is a helper function that finds an index
/// that corresponds to the image colors matrix.
int getColorIndex(
  /// selectorWH is the selector width or height
  double selectorWH,

  /// selectorLT is the selector left or top
  double selectorLT,

  /// boxLT is the box(key) left or top
  double boxLT,

  /// divider is the number of rows or columns from the image matrix
  int divider,
) {
  // get maximum height per image color row within the selector
  final chunkSize = selectorWH / divider;

  double diff = selectorLT - boxLT;
  int index = 0;

  while (diff < 0) {
    diff += chunkSize;

    index++;
  }

  // return index or last index of m or n when
  // index is not less than divider to avoid array overflow error.
  return math.min(index, divider - 1);
}
