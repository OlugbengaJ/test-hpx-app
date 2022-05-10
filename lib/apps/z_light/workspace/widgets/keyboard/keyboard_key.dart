import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/key_rrect.dart';
import 'package:hpx/models/apps/zlightspace_models/workspace_models/key_model.dart';
import 'package:hpx/providers/apps/zlightspace_providers/workspace_providers/workspace_provider.dart';
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

    keyModel.highlightKey(isWidgetInZone);
    if (isWidgetInZone == true) {
      keyModel.setPathColors(provider.animColors);
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
