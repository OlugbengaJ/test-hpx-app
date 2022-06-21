import 'package:flutter/cupertino.dart';
import 'package:hpx/apps/z_light/globals.dart';

class ScrollbarProvider with ChangeNotifier {
  /// [_left] is the left offset used by the horizontal scrollbar.
  double? _left;

  /// [_top] is the top offset used by the vertical scrollbar.
  double? _top;

  /// [left] returns the [_left] offset.
  double? get left => _left;

  /// [top] returns the [_top] offset.
  double? get top => _top;

  /// [thumbSizeH] size of the horizontal thumb.
  double? thumbSizeH;
  double? initThumbSizeH;

  /// [thumbSizeV] size of the vertical thumb.
  double? thumbSizeV;

  /// [scaleFactorH] scales the horizontal thumb to update [thumbSizeH].
  double? scaleFactorH;

  /// [scaleFactorV] scales the vertical thumb to update [thumbSizeV].
  double? scaleFactorV;

  /// [_scaleChange] gets the ratio of change between old scale and new scale.
  double _scaleChange(double scale, double? scaleFactor) {
    return (scale - (scaleFactor ?? scale)) / (scaleFactor ?? scale);
  }

  /// [initHorizontalScroll] sets the horizontal thumb and offset on changes.
  void initHorizontalScroll(BoxConstraints constraints, double? offset,
      double scale, double minScale, double maxScale) {
    final width = constraints.maxWidth - (3 * offset!);

    if (scaleFactorH == null) {
      scaleFactorH = maxScale - minScale;
      initThumbSizeH = width * scale / 100;
      _left = (width - initThumbSizeH!) / 2;
    }

    final scaleDiff = (scale - minScale + 10) * 1.4;
    thumbSizeH = initThumbSizeH! - scaleDiff;

    // determine the ratio change in scale
    double scaleRatio = _scaleChange(scale, scaleFactorH);

    // if (scale != scaleFactorH) {
    // if (scaleRatio == 0) {
    //   // set thumb to scale fraction of width.
    //   thumbSizeH = initThumbSizeH;
    //   _left = (width - thumbSizeH!) / 2;
    // } else {
    //   int multiplier = 1;

    //   if (scaleRatio > 0) {
    //     // positive change
    //     while (true) {
    //       scaleRatio--;
    //       if (scaleRatio < 1) break;
    //       multiplier++;
    //     }

    //     thumbSizeH = (thumbSizeH! / multiplier) -
    //         (thumbSizeH! * (multiplier + scaleRatio));
    //   } else if (scaleRatio < 0) {
    //     // negative change
    //     while (true) {
    //       scaleRatio++;
    //       multiplier++;

    //       if (scaleRatio > 0) break;
    //     }

    //     thumbSizeH = (thumbSizeH! * multiplier) + (thumbSizeH! / scaleRatio);
    //   }

    //   // if (scaleRatio >= 1) {
    //   //   final s = g - 1;
    //   //   thumbSizeH = thumbSizeH! + (thumbSizeH! * s);
    //   // } else {
    //   //   thumbSizeH = thumbSizeH! + (thumbSizeH! - g);
    //   // }
    //   // thumbSizeH = thumbSizeH! + (thumbSizeH! * scaleRatio).abs();
    // }
    // // }

    // if (_left! > width - thumbSizeH!) {
    //   _left = (width - thumbSizeH!) / 2;
    // }

    // debugPrint(
    //     'Hscroll scale $scale, percent $scaleRatio, thumb $thumbSizeH, left $left, width $width');
  }

  /// [initVerticalScroll] sets the vertical thumb and offset on changes.
  void initVerticalScroll(
      BoxConstraints constraints, double? offset, double scale) {
    final height = constraints.maxHeight - (3 * offset!);

    // determine the ratio change in scale
    final scaleRatio = _scaleChange(scale, scaleFactorV);

    if (scale != scaleFactorV) {
      scaleFactorV = scale;

      if (scaleRatio == 0) {
        // set thumb to scale fraction of height.
        thumbSizeV = height * scale;
        _top = (height - thumbSizeV!) / 2;
      } else if (scaleRatio > 0) {
        thumbSizeV = (thumbSizeV! - (thumbSizeV! * scaleRatio)).abs();
        // _top = _top! - (_top! * percent);
      } else {
        thumbSizeV = thumbSizeV! + (thumbSizeV! * scaleRatio).abs();
        // _top = _top! + (_top! * percent);
      }
    }

    // _top ??= (height - thumbSizeV!) / 2;

    if (_top! > height - thumbSizeV!) {
      _top = (height - thumbSizeV!) / 2;
    }

    // debugPrint(
    //     'Vscroll scale $scale, percent $scaleRatio, thumb $thumbSizeV, top $top, height $height');
  }

  /// [hScrollSize] returns the size of the horizontal scroll track through a global key.
  Size get hScrollSize {
    final renderBox =
        hScrollbarKey.currentContext?.findRenderObject() as RenderBox;

    return renderBox.size;
  }

  /// [vScrollSize] returns the size of the vertical scroll track through a global key.
  Size get vScrollSize {
    final renderBox =
        vScrollbarKey.currentContext?.findRenderObject() as RenderBox;

    return renderBox.size;
  }

  /// [onPanHorizontal] is the callback function for horizontal scrolling.
  bool onPanHorizontal(DragUpdateDetails details) {
    // drag updated
    final left = _left! + (details.delta.dx);

    if (left >= 0 && left <= hScrollSize.width - thumbSizeH!) {
      _left = left;

      notifyListeners();
      return true;
    }

    return false;
  }

  /// [onPanVertical] is the callback function for vertical scrolling.
  bool onPanVertical(DragUpdateDetails details) {
    // drag updated
    final top = _top! + (details.delta.dy);

    if (top >= 0 && top <= vScrollSize.height - thumbSizeV!) {
      _top = top;

      notifyListeners();
      return true;
    }

    return false;
  }

  /// [onTapUp] handles the scroll up button.
  ScrollDetails onTapUp() {
    double diff = -15.0;

    if (_top! + diff < 0) {
      // top cannot be less than 0, hence set diff to negative top.
      diff = -_top!;
    }

    final details =
        DragUpdateDetails(globalPosition: Offset.zero, delta: Offset(0, diff));

    return ScrollDetails(onPanVertical(details), details);
  }

  /// [onTapDown] handles the scroll down button.
  ScrollDetails onTapDown() {
    double diff = 15.0;

    if (_top! + diff > vScrollSize.height - thumbSizeV!) {
      // top cannot exceed height of track minus thumb,
      // hence set top to difference remaining.
      diff = vScrollSize.height - thumbSizeV! - _top!;
    }

    final details =
        DragUpdateDetails(globalPosition: Offset.zero, delta: Offset(0, diff));

    return ScrollDetails(onPanVertical(details), details);
  }

  /// [onTapLeft] handles the scroll left button.
  ScrollDetails onTapLeft() {
    double diff = -15.0;

    if (_left! + diff < 0) {
      // left cannot be less than 0, hence set diff to negative left.
      diff = -_left!;
    }

    final details =
        DragUpdateDetails(globalPosition: Offset.zero, delta: Offset(diff, 0));

    return ScrollDetails(onPanHorizontal(details), details);
  }

  /// [onTapRight] handles the scroll right button.
  ScrollDetails onTapRight() {
    double diff = 15.0;

    if (_left! + diff > hScrollSize.width - thumbSizeH!) {
      // left cannot exceed width of track minus thumb,
      // hence set left to difference remaining.
      diff = hScrollSize.width - thumbSizeH! - _left!;
    }

    final details =
        DragUpdateDetails(globalPosition: Offset.zero, delta: Offset(diff, 0));

    return ScrollDetails(onPanHorizontal(details), details);
  }

  void onPanDown(DragDownDetails details) {
    // drag started
  }

  void onPanEnd(DragEndDetails details) {
    // drag ended
  }
}

class ScrollDetails {
  /// [ScrollDetails] returns scrolling state and [DragUpdateDetails].
  const ScrollDetails(this.scrolling, this.details);

  final DragUpdateDetails details;
  final bool scrolling;
}
