import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_row_caps.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_row_ctrl.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_row_fn.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_row_num.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_row_shift.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_row_tab.dart';

class Keyboard extends StatelessWidget {
  /// [Keyboard] creates the layout of the keyboard by combining the various rows of keys.
  /// i.e. [KeyboardRowFn], [KeyboardRowNum], [KeyboardRowTab],
  /// [KeyboardRowCaps], [KeyboardRowShift], and [KeyboardRowCtrl]
  const Keyboard({Key? key, required this.zoomScale}) : super(key: key);

  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        KeyboardRowFn(key: const ValueKey(0), zoomScale: zoomScale),
        KeyboardRowNum(key: const ValueKey(1), zoomScale: zoomScale),
        KeyboardRowTab(key: const ValueKey(2), zoomScale: zoomScale),
        KeyboardRowCaps(key: const ValueKey(3), zoomScale: zoomScale),
        KeyboardRowShift(key: const ValueKey(4), zoomScale: zoomScale),
        KeyboardRowCtrl(key: const ValueKey(5), zoomScale: zoomScale),
      ],
    );
  }
}
