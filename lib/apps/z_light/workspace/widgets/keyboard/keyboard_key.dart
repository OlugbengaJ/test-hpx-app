import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/key_rrect.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/models/apps/zlightspace_models/workspace_models/key_code.dart';
import 'package:hpx/providers/key_model.dart';
import 'package:hpx/providers/keys_provider.dart';
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
    final keysProvider = Provider.of<KeysProvider>(context);

    return Stack(
      children: [
        Material(
          color: Colors.transparent,
          child: Consumer<WorkspaceProvider>(
            builder: (context, workspaceProvider, child) {
              return InkWell(
                onTap:
                    workspaceProvider.isDragModeHighlight ? onTapHandler : null,

                // listens to key changes and allows updating this key instance
                child: AnimatedBuilder(
                  animation: workspaceProvider.controller,
                  builder: (context, child) => Consumer<KeyModel>(
                    builder: (context, keyModel, child) => KeyRRect(
                      animation: workspaceProvider.controller,
                      keyModel: _updateKeyInfo(
                        workspaceProvider,
                        layersProvider,
                        keysProvider,
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
  KeysProvider keysProvider,
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

    // remove sublayers that don't exist in shortcut mode.
    if (layers.isNotEmpty) {
      final sublayers = layersProvider.sublayerItems;
      final shortcutKeys = keysProvider.shortcutKeys.keys.toSet();

      for (var key in shortcutKeys) {
        // remove all shortcuts since none exists in layer
        if (sublayers.isEmpty) keysProvider.removeShortcut(key);

        if (!sublayers.any((s) => '${s.id}' == key)) {
          // shortcut key does not exist in sublayer, hence remove.
          keysProvider.removeShortcut(key);
        }
      }
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

      layer.removeKey(keyModel);

      KeyPaintRect chip = KeyPaintRect('$layerId');
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

      if (boxZone != null) {
        // insert new chip with the layer id as key

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

            updateKeyAndLayer(keyModel, chip, layer);
            break;
          case EnumModes.colorcycle:
            final animColor = provider.animColorTween(
                layer.mode?.currentColor as List<Color>,
                speed: layer.mode?.effects.speed);

            chip.color = animColor!;

            updateKeyAndLayer(keyModel, chip, layer);
            break;
          case EnumModes.contactsupport:
            // do nothing here
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

              chip.color = rowColors[colIndex];
            }

            updateKeyAndLayer(keyModel, chip, layer);
            break;
          case EnumModes.shortcut:
            final sublayer = layersProvider.getCurrentSublayer();
            if (sublayer != null) {
              // update key only when sublayer is active
              final sublayerId = sublayer.id;
              chip = KeyPaintRect('$sublayerId')
                ..color = sublayer.shortcutColor
                ..showOutline = true;

              if (!keysProvider.shortcutKeyExist(keyModel)) {
                // add shortcut key since it does not exist in shortcut.
                updateKeyAndLayer(keyModel, chip, layer);
                keysProvider.addShortcutKey('$sublayerId', keyModel.copyWith());

                break;
              }

              // key already exist in shortcut
              final shortcutKey = keysProvider.getShortcutKey(keyModel);

              // set opacity based on layer visibility
              shortcutKey?.value.topChip?.opacity = sublayer.visible ? 1 : 0;

              if (shortcutKey?.key == chip.chipKey) {
                // update key color if current chip key equals the shortcut key.
                final topChip = shortcutKey?.value.topChip;
                topChip?.color = sublayer.shortcutColor;

                keyModel.addChip(shortcutKey?.value.topChip);
              } else {
                keyModel.addChip(shortcutKey?.value.topChip);
              }
            }

            break;
          case EnumModes.wave:
            if (layer.mode?.currentColor != null) {
              final colorLength = layer.mode!.currentColor.length;

              // determines the index of color to use
              int index;
              final int colIndex = getColorIndex(boxZone.selectorRect.width,
                  boxZone.selectorRect.left, boxZone.boxRect.left, colorLength);

              final int rowIndex = getColorIndex(boxZone.selectorRect.height,
                  boxZone.selectorRect.top, boxZone.boxRect.top, colorLength);

              final animValue =
                  provider.animValue(speed: layer.mode?.effects.speed);

              // offset column index by the animation value and color length
              final shiftIndex = (animValue! * colorLength).ceil();

              if (lastShiftIndex != shiftIndex) {
                lastShiftIndex = shiftIndex;

                if (incrementer < colorLength - 1) {
                  incrementer++;
                } else {
                  incrementer = 0;
                }
              }

              final direction = layer.mode!.effects.degree!;
              if (direction > 225 && direction < 315) {
                // TODO: rowIndex +/- colIndex creates a directional wave
                // index = (rowIndex + colIndex + incrementer).abs() % colorLength;

                // wave flows along negative y axis.
                index = (rowIndex + incrementer).abs() % colorLength;
              } else if (direction > 45 && direction < 135) {
                // wave flows along positive y axis.
                index = (rowIndex - incrementer).abs() % colorLength;
              } else if (direction > 90 && direction < 270) {
                // wave flows along negative x axis.
                index = (colIndex + incrementer).abs() % colorLength;
              } else {
                // wave flows along positive x axis.
                index = (colIndex - incrementer).abs() % colorLength;
              }

              // final dir = math.tan(direction).floor();
              // index = (colIndex - (rowIndex * dir) + incrementer).abs() %
              //     colorLength;
              chip.color = layer.mode!.currentColor[index];
            }

            updateKeyAndLayer(keyModel, chip, layer);
            break;
          default:
            // handles other modes
            updateKeyAndLayer(keyModel, chip, layer);
            break;
        }
      }
      // no boxing is happening beyond this point.
      else if (layer.mode?.value == EnumModes.shortcut) {
        // paint previously selected shortcut keys.
        final keyCopy = keysProvider.getShortcutKey(keyModel);

        if (keyCopy != null) {
          // update key color if sublayer id equals key copy id
          final sublayer = layersProvider.getCurrentSublayer();
          if (keyCopy.key == '${sublayer?.id}') {
            keyCopy.value.topChip?.color = sublayer!.shortcutColor;
            keyCopy.value.topChip?.showOutline = true;
          } else {
            keyCopy.value.topChip?.showOutline = false;
          }

          // set opacity based on layer visibility
          if (sublayer != null) {
            keyCopy.value.topChip?.opacity = sublayer.visible ? 1 : 0;
          }

          // add the key copy top chip.
          keyModel.addChip(keyCopy.value.topChip);
        }
      } else if (layer.mode?.value == EnumModes.contactsupport) {
        if (keyModel.keyCode == KeyCode.kFn ||
            keyModel.keyCode == KeyCode.kF12) {
          updateKeyAndLayer(keyModel, chip, layer);
        }
      }
    }
  }

  return keyModel;
}

void updateKeyAndLayer(
    KeyModel keyModel, KeyPaintRect chip, LayerItemModel layer) {
  chip.opacity = layer.visible ? 1 : 0;

  // add key model to layer
  layer.addKey(keyModel);

  // add the chip
  keyModel.addChip(chip);
}

int lastShiftIndex = -1;
int incrementer = -1;

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
  int index = -1;

  while (diff < 0) {
    diff += chunkSize;

    index++;
  }

  // reset index if less than zero to avoid array overflow error.
  if (index < 0) index = 0;

  return index;
}
