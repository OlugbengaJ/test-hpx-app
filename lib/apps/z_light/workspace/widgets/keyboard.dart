import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard_row_fn.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard_row_num.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard_row_tab.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key, required this.zoomScale}) : super(key: key);

  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        KeyboardRowFn(zoomScale: zoomScale),
        KeyboardRowNum(zoomScale: zoomScale),
        KeyboardRowTab(zoomScale: zoomScale),
      ],
    );
  }
}
