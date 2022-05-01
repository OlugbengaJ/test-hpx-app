import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_row_caps.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_row_ctrl.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_row_fn.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_row_num.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_row_shift.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_row_tab.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key, required this.zoomScale}) : super(key: key);

  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        KeyboardRowFn(key: const ValueKey(1), zoomScale: zoomScale),
        // KeyboardRowNum(zoomScale: zoomScale),
        // KeyboardRowTab(zoomScale: zoomScale),
        // KeyboardRowCaps(zoomScale: zoomScale),
        // KeyboardRowShift(zoomScale: zoomScale),
        // KeyboardRowCtrl(zoomScale: zoomScale),
      ],
    );
  }
}
