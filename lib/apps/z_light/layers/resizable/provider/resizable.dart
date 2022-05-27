import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpx/providers/layers_provider/layers.dart';

/// Keys to watch by the ZoneSelector and the resizable widgets
class ResizableProvider extends ChangeNotifier {
  GlobalKey draggableKey = GlobalKey();
  Offset initialPosition = Offset.zero;
  late double areaHeight = Get.height * 0.7;
  late double areaWidth = Get.width * 0.7;
  late double minWidth = 50;
  late double minHeight = 50;
  

  late double height = 500;
  late double width = 500;

  double top = 0.0;
  double left = 0.0;
  double bottom = 0.0;
  double right = 0.0;

  bool showDragWidgets = true;



  initialize() {
    initialPosition = Offset(areaWidth / 2, areaHeight / 2);
    height = areaHeight / 2;
    width = areaWidth / 2;

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
  }

  void toggleShowDragWigets() {
    showDragWidgets = !showDragWidgets;
  }


  Size calculateSizeFromLocal(){
    RenderBox box = draggableKey.currentContext?.findRenderObject() as RenderBox;
    final boxSize = box.size;
    return boxSize;
  }

  void setSize({
    double? newTop,
    double? newLeft,
    double? newRight,
    double? newBottom,
  }) {
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

    notifyListeners();
  }

  void quantify({
    required final double newTop,
    required final double newLeft,
    required final double newRight,
    required final double newBottom,
  }) {
    calculateWidgetSize( top: newTop, left: newLeft, bottom: newBottom, right: newRight);
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

  //bool checkTopBotMaxSize(final double newTop, final double newBottom) =>(newTop >= 0 && newBottom >= 0) && (height >= minHeight);
  bool checkTopBotMaxSize(final double newTop, final double newBottom) =>(newTop >= 0 && newBottom >= 0);
  bool checkLeftRightMaxSize(final double newLeft, final double newRight) =>  (newLeft >= 0 && newRight >= 0);

  void calculateWidgetSize({required final double top, required final double left, required final double bottom, required final double right,}) {    
    width = areaWidth - (left + right);
    height = areaHeight - (top + bottom);
    notifyListeners();
    calculateSizeFromLocal();
  }

  void onTopLeftDrag(double dx, double dy) {
    var mid = (dx + dy) / 2;
    if(dy<0){
      setSize(
        newTop: top + mid,
        newLeft: left + mid,
      );
    }else{
      if(calculateSizeFromLocal().height>minHeight){
        setSize(
          newTop: top + mid,
          newLeft: left + mid,
        );
      }
    }    
  }

  void onTopCenterDrag(double dx, double dy) {
    if(dy<0){
      setSize(newTop: top + dy); // 
    }else{
      if(calculateSizeFromLocal().height>minHeight){
        setSize(newTop: top + dy);
      }
    }
    
  }

  void onTopRightDrag(double dx, double dy) {
    var mid = (dx - dy) / 2;

    if(dy<0){
      setSize(
        newTop: top - mid,
        newRight: right - mid,
      );
    }else{
      if(calculateSizeFromLocal().height>minHeight){
        setSize(
          newTop: top - mid,
          newRight: right - mid,
        );
      }
    }    
  }

  void onCenterLeftDrag(double dx, double dy) {
    if(dx<0){
      setSize(newLeft: left + dx);
    }else{
      if(calculateSizeFromLocal().width>minWidth){
        setSize(newLeft: left + dx);
      }
    }
    
  }

  void onCenterDrag(double dx, double dy) {
    setSize(
      newTop: top + dy,
      newLeft: left + dx,
      newBottom: bottom - dy,
      newRight: right - dx,
    );
  }

  void onCenterRightDrag(double dx, double dy) {
    if(dx>0){
      setSize(newRight: right - dx);
    }else{
      if(calculateSizeFromLocal().width>minWidth){
        setSize(newRight: right - dx);
      }
    }
  }

  void onBottomLeftDrag(double dx, double dy) {
    var mid = (dy - dx) / 2;
    
    if(dy>0){
      setSize(newBottom: bottom - mid, newLeft: left - mid);
    }else{
      if(calculateSizeFromLocal().height>minHeight){
        setSize(newBottom: bottom - mid, newLeft: left - mid);
      }
    }
  }

  void onBottomCenterDrag(double dx, double dy) {
    if(dy>0){
      setSize(newBottom: bottom - dy);
    }else{
      if(calculateSizeFromLocal().height>minHeight){
        setSize(newBottom: bottom - dy);
      }
    }
  }

  void onBottomRightDrag(double dx, double dy) {
    var mid = (dx + dy) / 2;

    if(dy>0){
      setSize(
        newRight: right - mid,
        newBottom: bottom - mid,
      );
    }else{
      if(calculateSizeFromLocal().height>minHeight){
        setSize(
          newRight: right - mid,
          newBottom: bottom - mid,
        );
      }
    }
  }

  void onDragEnd(LayersProvider provider){
    provider.updateView(top, bottom, left, right);
    notifyListeners();    
  }
}
