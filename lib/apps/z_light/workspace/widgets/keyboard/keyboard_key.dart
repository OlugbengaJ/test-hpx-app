import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/key_rrect.dart';
import 'package:hpx/providers/key_model.dart';
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

  final VoidCallback? onTapHandler;
  final double zoomScale;

  KeyModel _updateKeyInfo(
    WorkspaceProvider provider,
    KeyModel keyModel,
    RenderBox? renderBox,
  ) {
    final isWidgetInZone = provider.isWidgetInZone(renderBox);

    if (isWidgetInZone == true && provider.isDragModeZone) {
      keyModel.selectKey(isWidgetInZone);
      keyModel.setPathColors(provider.animColors);
    }

    if (provider.isDragModeClick &&
        isWidgetInZone == true &&
        !keyModel.isSelected) {
      keyModel.selectKey(isWidgetInZone);
    } else if (provider.isDragModeClick &&
        isWidgetInZone == true &&
        keyModel.isSelected) {
      keyModel.unSelectKey();
    }

    return keyModel;
  }

  @override
  Widget build(BuildContext context) {
    // Gets access to the widget's position (offset) in the widget tree.
    final box = context.findRenderObject() as RenderBox?;

    return Stack(
      children: [
        Material(
          child: Consumer<WorkspaceProvider>(
            builder: (context, workspaceProvider, child) => InkWell(
              onTap: onTapHandler,

              // listens to key changes and allows updating this key instance
              child: Consumer<KeyModel>(
                builder: (context, keyModel, child) => KeyRRect(
                  keyModel: _updateKeyInfo(workspaceProvider, keyModel, box),
                  zoomScale: zoomScale,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
