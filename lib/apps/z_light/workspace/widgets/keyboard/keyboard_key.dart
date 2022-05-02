import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/key_rrect.dart';
import 'package:hpx/providers/key_model.dart';
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
    // final KeyModel keyModel = Provider.of<KeyModel>(context);

    return Stack(
      children: [
        Material(
          child: InkWell(
            onTap: onTapHandler,
            onTapDown: (details) => debugPrint('tap down'),
            onHighlightChanged: (e) => debugPrint('highlight $e'),
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
      ],
    );
  }
}
