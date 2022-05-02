import 'package:flutter/material.dart';

class ZoneSelectorProvider with ChangeNotifier{
  Offset startingPoint = const Offset(0,0);
  GlobalKey selectorKey = GlobalKey();
  List<Map<String, dynamic>> zoneToPaint = [];
  
  double topPadding = 0.0;
  double leftPadding = 0.0;
  
  double top = 0.0;
  double left = 0.0;
  double height = 0.0;
  double width = 0.0;
  Size boxSize = const Size(0,0);
  bool zoneSelecting = false;


  void updatePosition(){
    print("Position updated");
    zoneToPaint.clear();
    notifyListeners();
  }


  void setStartingPoint(double x, double y){
    zoneToPaint.clear();
    startingPoint = Offset(x, y);
    height = 0;
    width = 0;
    top = startingPoint.dy;
    left = startingPoint.dx;
    zoneSelecting = true;
    notifyListeners();
  }

  void setPaddings(double top, double left){
    topPadding = top;
    leftPadding = left;
    notifyListeners();
  }

  paintColor(GlobalKey widgetKey){
    RenderBox selectorBox = selectorKey.currentContext?.findRenderObject() as RenderBox;
    final selectorPosition = selectorBox.localToGlobal(Offset.zero);

    RenderBox box = widgetKey.currentContext?.findRenderObject() as RenderBox;
    final boxSize = box.size;
    
    var position = box.localToGlobal(Offset.zero);
    final selectorBoxSize = selectorBox.size;      

    final collide = (
      position.dx < selectorPosition.dx + selectorBoxSize.width && 
      position.dx + boxSize.width > selectorPosition.dx &&
      position.dy < selectorPosition.dy + selectorBoxSize.height &&
      position.dy + boxSize.height > selectorPosition.dy
    );


    if(collide){
      zoneToPaint.add(
        {
          "size": box.size,
          "position": Offset(position.dx - leftPadding, position.dy - topPadding),
        }
      );
    }
    notifyListeners();
  }


  void changeTop(double y){
    startingPoint = Offset(startingPoint.dx, y);
  }
  
  void changeLeft(double x){
    startingPoint = Offset(x, startingPoint.dy);
  }  


  void startMoving(double x, double y){
    zoneSelecting = true;
    if((y - top)<0){
      changeTop(y);
    }

    if((x - left)<0){
      changeLeft(x);
    }
    
    
    height = (top - y).abs();
    width = (left - x).abs();
    notifyListeners();
  }

  void stopMoving(){
    boxSize = Size(width, height);
    zoneSelecting = false;
    notifyListeners();
  }

  void onTap(double x, double y){
    zoneToPaint.clear();
    height = 0;
    width = 0;
    notifyListeners();
  }


}