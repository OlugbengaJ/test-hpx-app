import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/key_rrect.dart';

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({
    Key? key,
    this.onTapHandler,
    this.keyText,
    this.keyColor = Colors.white,
    this.keyPathColors = const [Colors.red, Colors.white],
    this.keyLeft = 0,
    this.keyTop = 0,
    required this.keyWidth,
    required this.keyHeight,
    required this.keyRadius,
    required this.zoomScale,
  }) : super(key: key);

  final VoidCallback? onTapHandler;

  final String? keyText;
  final Color? keyColor;
  final List<Color>? keyPathColors;

  final double keyLeft;
  final double keyTop;
  final double keyWidth;
  final double keyHeight;
  final double keyRadius;
  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTapHandler,
          child: KeyRRect(
            keyText: keyText,
            keyColor: keyColor!,
            keyPathColors: keyPathColors!,
            zoomScale: zoomScale,
            keyLeft: keyLeft * zoomScale,
            keyTop: keyTop * zoomScale,
            keyRadius: keyRadius,
            keyWidth: keyWidth,
            keyHeight: keyHeight,
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
