import 'package:hpx/apps/z_light/app_enum.dart';

class SelectionOffset {
  /// [id] identity of this selection offset.
  late String id;

  /// Indicates the last selection used i.e. highlight, resizable or non.
  late WorkspaceDragMode? dragMode;

  /// [highlightLTWH] is the Rect position for the highlight.
  late LTWH? highlightLTWH;

  /// [resizableLTWH] is the Rect position for the resizable.
  late LTWH? resizableLTWH;
}

class LTWH {
  /// [LTWH] stores location information and could be used to draw out a Rect
  LTWH([this.left, this.top, this.width, this.height]);

  late double? left;
  late double? top;
  late double? width;
  late double? height;
}
