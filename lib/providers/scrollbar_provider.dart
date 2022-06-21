import 'package:flutter/cupertino.dart';
import 'package:hpx/apps/z_light/globals.dart';

class ScrollbarProvider with ChangeNotifier {
  double? _left;
  double? _top;

  double? get left => _left;
  double? get top => _top;

  double? thumbSizeH;
  double? thumbSizeV;

  double? scaleFactorH;
  double? scaleFactorV;

  double scaleChange(double scale, double? scaleFactor) {
    return (scale - (scaleFactor ?? scale)) / (scaleFactor ?? scale);
  }

  void initHorizontalScroll(
      BoxConstraints constraints, double? offset, double scale) {
    final width = constraints.maxWidth - (3 * offset!);

    // determine the percent change in scale
    final percent = scaleChange(scale, scaleFactorH);

    if (scale != scaleFactorH) {
      scaleFactorH = scale;

      if (percent == 0) {
        // set thumb to scale fraction of width.
        thumbSizeH = width * scale;
        _left = (width - thumbSizeH!) / 2;
      } else if (percent > 0) {
        thumbSizeH = thumbSizeH! - (thumbSizeH! * percent);
      } else {
        thumbSizeH = thumbSizeH! + (thumbSizeH! * percent).abs();
      }
    }

    if (_left! > width - thumbSizeH!) {
      _left = (width - thumbSizeH!) / 2;
    }

    debugPrint(
        'Hscroll scale $scale, percent $percent, thumb $thumbSizeH, left $left, width $width');
  }

  void initVerticalScroll(
      BoxConstraints constraints, double? offset, double scale) {
    final height = constraints.maxHeight - (3 * offset!);

    // determine the percent change in scale
    final percent = scaleChange(scale, scaleFactorV);

    if (scale != scaleFactorV) {
      scaleFactorV = scale;

      if (percent == 0) {
        // set thumb to scale fraction of height.
        thumbSizeV = height * scale;
        _top = (height - thumbSizeV!) / 2;
      } else if (percent > 0) {
        thumbSizeV = thumbSizeV! - (thumbSizeV! * percent);
        // _top = _top! - (_top! * percent);
      } else {
        thumbSizeV = thumbSizeV! + (thumbSizeV! * percent).abs();
        // _top = _top! + (_top! * percent);
      }
    }

    // _top ??= (height - thumbSizeV!) / 2;

    if (_top! > height - thumbSizeV!) {
      _top = (height - thumbSizeV!) / 2;
    }

    debugPrint(
        'Vscroll scale $scale, percent $percent, thumb $thumbSizeV, top $top, height $height');
  }

  Size get hScrollSize {
    final renderBox =
        hScrollbarKey.currentContext?.findRenderObject() as RenderBox;

    return renderBox.size;
  }

  Size get vScrollSize {
    final renderBox =
        vScrollbarKey.currentContext?.findRenderObject() as RenderBox;

    return renderBox.size;
  }

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

  void onPanDown(DragDownDetails details) {
    // drag started
  }

  void onPanEnd(DragEndDetails details) {
    // drag ended
  }
}
