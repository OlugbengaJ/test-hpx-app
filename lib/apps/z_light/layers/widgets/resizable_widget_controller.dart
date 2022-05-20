import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hpx/providers/layers_provider/layers.dart';

class ResizableWidgetController extends GetxController {
  ResizableWidgetController({
    required this.initialPosition ,
    this.areaHeight = 500,
    this.areaWidth = 500,
    this.height = 500,
    this.width = 500,
    this.minWidth = 0.0,
    this.minHeight = 0.0,
    this.showDragWidgets = true,
  });

  final Offset initialPosition;
  double areaHeight;
  double areaWidth;
  double minWidth;
  double minHeight;

  late double height;
  late double width;

  double top = 0.0;
  double left = 0.0;
  double bottom = 0.0;
  double right = 0.0;

  bool showDragWidgets;

  RxList zoneToPaint = <Map<String, dynamic>>[].obs;
  GlobalKey draggableKey = GlobalKey();

  double topPadding = 0.0;
  double leftPadding = 0.0;

  @override
  void onInit() {
    Offset initialPosition = Offset(areaWidth / 2, areaHeight / 2);
    double newTop = initialPosition.dy - height / 2;
    double newBottom = areaHeight - height - newTop;
    double newLeft = initialPosition.dx - (width / 2);
    double newRight = (areaWidth - width) - newLeft;

    // init top&bottom
    if (newTop < 0) {
      bottom = newBottom + newTop;
    } else if (newBottom < 0) {
      top = newTop + newBottom;
    } else {
      bottom = newBottom;
      top = newTop;
    }
    // init left&right
    if (newLeft < 0) {
      right = newRight + newLeft;
    } else if (newRight < 0) {
      left = newLeft + newRight;
    } else {
      right = newRight;
      left = newLeft;
    }

    leftPadding = newLeft ;
    topPadding = newTop;

    super.onInit();
  }

  

  void toggleShowDragWigets() {
    showDragWidgets = !showDragWidgets;
    update();
  }

  void setSize({double? newTop,  double? newLeft,double? newRight, double? newBottom,}) {

    newTop = newTop ?? top;
    newLeft = newLeft ?? left;
    newRight = newRight ?? right;
    newBottom = newBottom ?? bottom;

    quantify(
      newTop: newTop,
      newLeft: newLeft,
      newRight: newRight,
      newBottom: newBottom,
    );

    update();
  }

  void quantify({ required final double newTop, required final double newLeft, required final double newRight, required final double newBottom,}) {
    calculateWidgetSize(top: newTop, left: newLeft, bottom: newBottom, right: newRight);
    if (checkTopBotMaxSize(newTop, newBottom)) {
      top = newTop;
      bottom = newBottom;
    }
    if (checkLeftRightMaxSize(newLeft, newRight)) {
      left = newLeft;
      right = newRight;
    }
    calculateWidgetSize(bottom: bottom, left: left, right: right, top: top);
  }

  bool checkTopBotMaxSize(final double newTop, final double newBottom) =>  (newTop >= 0 && newBottom >= 0) && (height >= minHeight);
  bool checkLeftRightMaxSize(final double newLeft, final double newRight) => (newLeft >= 0 && newRight >= 0) && (width >= minWidth);

  void calculateWidgetSize({ required final double top, required final double left, required final double bottom, required final double right,
  }) {
    width = areaWidth - (left + right);
    height = areaHeight - (top + bottom);
  }

  void onTopLeftDrag(dx, dy) {
    var mid = (dx + dy) / 2;
    setSize(
      newTop: top + mid,
      newLeft: left + mid,
    );
  }

  void onTopCenterDrag(dx, dy) {
    setSize(
      newTop: top + dy
    );
  }

  void onTopRightDrag(dx, dy) {
    var mid = (dx - dy) / 2;
    setSize(
      newTop: top - mid,
      newRight: right - mid,
    );
  }

  void onCenterLeftDrag(dx, dy) {
    setSize(newLeft: left + dx);
  }

  void onCenterDrag(dx, dy) {
    setSize(
      newTop: top + dy,
      newLeft: left + dx,
      newBottom: bottom - dy,
      newRight: right - dx,
    );
  }

  void onCenterRightDrag(dx, dy) {
    setSize(newRight: right - dx);
  }

  void onBottomLeftDrag(dx, dy) {
    var mid = (dy - dx) / 2;
    setSize(newBottom: bottom - mid, newLeft: left - mid);
  }

  void onBottomCenterDrag(dx, dy) {
    setSize(newBottom: bottom - dy);
  }

  void onBottomRightDrag(dx, dy) {
    var mid = (dx + dy) / 2;

    setSize(
      newRight: right - mid,
      newBottom: bottom - mid,
    );
  }

  void onDragEnd(LayersProvider provider){
    provider.updateView(top, bottom, left, right);
    update();
    
  }

  void onSwitchIndex({double? newTop,  double? newLeft,double? newRight, double? newBottom,}) {
    newTop = newTop ?? top;
    newLeft = newLeft ?? left;
    newRight = newRight ?? right;
    newBottom = newBottom ?? bottom;

    setSize(
      newTop: newTop,
      newLeft: newLeft,
      newRight: newRight,
      newBottom: newBottom,
    );
    update();
  }

}