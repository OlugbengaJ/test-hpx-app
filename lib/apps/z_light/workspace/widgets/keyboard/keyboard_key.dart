import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/key_rrect.dart';
import 'package:hpx/providers/key_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
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
    final modeProvider = Provider.of<ModeProvider>(context);

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
                      modeProvider,
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
  ModeProvider modeProvider,
  KeyModel keyModel,
  RenderBox? renderBox,
) {
  final isWidgetInZone = provider.isWidgetInZone(renderBox);

  // final currentMode = modeProvider.currentMode;
  // List<Color> colors = [Colors.orange];

  // if (currentMode.currentColor.runtimeType.toString() == 'List<Color>') {
  //   colors = currentMode.currentColor as List<Color>;
  // }

  // if (provider.isDragModeZone || provider.isDragModeResizable) {
  //   keyModel.selectKey(isWidgetInZone);
  //   // if (isWidgetInZone == true && provider.isDragModeZone) {
  //   // if (isWidgetInZone == true) {
  //   //   // keyModel.setPathColors(colors);
  //   //   //(provider.animColors);
  //   // }
  // }
  final layerIndex = layersProvider.listIndex;
  bool layerVisible = false;
  if (layersProvider.layeritems.isNotEmpty) {
    final layer = layersProvider.layeritems[layerIndex];
    layerVisible = layer.visible;
  }
  keyModel.selectKey(isWidgetInZone, layerIndex, layerVisible,
      animValue: provider.animation.value);
  // if (provider.isDragModeClick &&
  //     isWidgetInZone == true &&
  //     !keyModel.isSelected) {
  //   keyModel.selectKey(isWidgetInZone);
  // } else if (provider.isDragModeClick &&
  //     isWidgetInZone == true &&
  //     keyModel.isSelected) {
  //   keyModel.unSelectKey();
  // }

  keyModel.highlightColor = modeProvider.currentMode.currentColor.first;

  return keyModel;
}
