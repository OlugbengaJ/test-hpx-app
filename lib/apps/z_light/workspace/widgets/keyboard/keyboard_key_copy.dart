import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/key_rrect.dart';
import 'package:hpx/providers/keyboard_provider.dart';

class KeyboardKeyCopy extends StatelessWidget {
  const KeyboardKeyCopy({
    Key? key,
    this.onTapHandler,
    required this.keyModel,
    required this.zoomScale,
  }) : super(key: key);

  final VoidCallback? onTapHandler;

  final KeyModel keyModel;
  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          child: InkWell(
            onTap: onTapHandler,
            child: KeyRRect(
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
        // Align(
        //   alignment: Alignment.topCenter,
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 100),
        //     child: Text(
        //       'Keys',
        //       style: Theme.of(context).textTheme.headline1,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
