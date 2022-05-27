import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/key_rows/imports.dart';
import 'package:hpx/utils/constants.dart';

class Keyboard extends StatelessWidget {
  /// [Keyboard] creates the layout of the keyboard by combining the various rows of keys.
  const Keyboard({Key? key, required this.zoomScale}) : super(key: key);

  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: SizedBox(
            width: Constants.zoomFactor * zoomScale * 1.01,
            child: Image.asset(
              Constants.laptopg9Image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30.0 * zoomScale),
          child: Column(
            children: [
              KeyboardRowFn(zoomScale: zoomScale),
              KeyboardRowNum(zoomScale: zoomScale),
              KeyboardRowTab(zoomScale: zoomScale),
              KeyboardRowCaps(zoomScale: zoomScale),
              KeyboardRowShift(zoomScale: zoomScale),
              KeyboardRowCtrl(zoomScale: zoomScale),
            ],
          ),
        ),
      ],
    );
  }
}
