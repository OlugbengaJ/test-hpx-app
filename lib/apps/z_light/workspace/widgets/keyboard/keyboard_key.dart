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

  @override
  Widget build(BuildContext context) {
    final KeyModel keyModelr = Provider.of<KeyModel>(context);

    /// Gets access to the widget's position (offset) in the widget tree.
    final box = keyModelr.getRenderObject(context);

    debugPrint('${box?.localToGlobal(const Offset(0, 0))}');

    return Stack(
      children: [
        Material(
          child: Consumer<WorkspaceProvider>(
            builder: (context, value, child) => InkWell(
              onTap: onTapHandler,
              onTapDown: (details) => debugPrint('tap down'),

              /// listens to key changes and allows updating this key instance
              child: Consumer<KeyModel>(
                builder: (context, keyModel, child) => KeyRRect(
                  paintingStyle: keyModel.paintingStyle,
                  keyText: keyModel.keyText,
                  keyTextColor: keyModel.keyTextColor,
                  keyTextDirection: keyModel.keyTextDirection,
                  keyPathColors: keyModel.keyPathColors!,
                  zoomScale: zoomScale,
                  keyLeft: keyModel.keyLeft * zoomScale,
                  keyTop: keyModel.keyTop * zoomScale,
                  keyRadius: keyModel.keyRadius,
                  keyWidth: keyModel.keyWidth,
                  keyHeight: keyModel.keyHeight,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
