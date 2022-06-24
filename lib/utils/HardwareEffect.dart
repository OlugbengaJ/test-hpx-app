import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:image/image.dart' as imageLib;

abstract class HardwareEffect {
  int _layerID;
  LayersProvider _layersProvider;

  HardwareEffect(this._layerID, this._layersProvider);
  int get layerID => this._layerID;

  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard);

  updateKeyColorInfo(
      {required Map<String, Map<String, Object>> keyboard,
      required String keyName,
      required Color color}) {
    keyboard[keyName]!["redOpacity"] = color.red;
    keyboard[keyName]!["greenOpacity"] = color.green;
    keyboard[keyName]!["blueOpacity"] = color.blue;
  }
}

class ModeEffect extends HardwareEffect {
  ModeEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider);

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = this
        ._layersProvider
        .layeritems
        .firstWhere((element) => element.id == this._layerID);
    layer.keys.forEach((key) {
      updateKeyColorInfo(
          keyboard: keyboard,
          keyName: key.keyCode.name,
          color: layer.mode?.currentColor.last);
    });

    return keyboard;
  }
}

class BreathingEffect extends HardwareEffect {
  var currentColor;
  BreathingEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider) {
    this.run();
  }

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = this
        ._layersProvider
        .layeritems
        .firstWhere((element) => element.id == this._layerID);
    layer.keys.forEach((key) {
      updateKeyColorInfo(
          keyboard: keyboard, keyName: key.keyCode.name, color: currentColor);
    });
    return keyboard;
  }

  fadeTransition(Color fromColor, Color toColor) async {
    int incomingRed = fromColor.red;
    int incomingGreen = fromColor.green;
    int incomingBlue = fromColor.blue;

    while (incomingRed != toColor.red ||
        incomingGreen != toColor.green ||
        incomingBlue != toColor.blue) {
      if (incomingRed > toColor.red) {
        incomingRed -= 1;
      } else if (incomingRed < toColor.red) {
        incomingRed += 1;
      }

      if (incomingGreen > toColor.green) {
        incomingGreen -= 1;
      } else if (incomingGreen < toColor.green) {
        incomingGreen += 1;
      }

      if (incomingBlue > toColor.blue) {
        incomingBlue -= 1;
      } else if (incomingBlue < toColor.blue) {
        incomingBlue += 1;
      }

      this.currentColor =
          Color.fromRGBO(incomingRed, incomingGreen, incomingBlue, 100);
      await Future.delayed(Duration(microseconds: 300), () => null);
    }
  }

  run() async {
    var reverse = false;
    while (true) {
      var layer = this
          ._layersProvider
          .layeritems
          .firstWhere((element) => element.id == this._layerID);
      var primaryColor = layer.mode?.currentColor.last;
      var secondaryColor = layer.mode?.currentColor.first;
      if (reverse) {
        await fadeTransition(secondaryColor, primaryColor);
        reverse = !reverse;
      } else {
        await fadeTransition(primaryColor, secondaryColor);
        reverse = !reverse;
      }
    }
  }
}

class ColorProductionEffect extends HardwareEffect {
  ColorProductionEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider);

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = this
        ._layersProvider
        .layeritems
        .firstWhere((element) => element.id == this._layerID);
    layer.keys.forEach((key) {
      updateKeyColorInfo(
          keyboard: keyboard,
          keyName: key.keyCode.name,
          color: layer.mode?.currentColor.last);
    });
    return keyboard;
  }
}

class WaveEffect extends HardwareEffect {
  WaveEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider);

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = this
        ._layersProvider
        .layeritems
        .firstWhere((element) => element.id == this._layerID);
    return keyboard;
  }

  /*List<List<dynamic>> getDividedZones(int size) {
    int smallestIdx = getIdx("smallest");
    int largestIdx = getIdx("largest");
  }

  int getIdx(String size) {
    var allKeys = this._layersProvider.layeritems.firstWhere((element) => element.id == this._layerID).keys.toList();
    var smallest = 100;
    allKeys.forEach((element) { 
      if
    })
   }

    */

}

class ColorCycleEffect extends HardwareEffect {
  var currentColor;
  ColorCycleEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider) {
    this.run();
  }

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = this
        ._layersProvider
        .layeritems
        .firstWhere((element) => element.id == this._layerID);
    layer.keys.forEach((key) {
      updateKeyColorInfo(
          keyboard: keyboard, keyName: key.keyCode.name, color: currentColor);
    });
    return keyboard;
  }

  run() async {
    while (true) {
      var layer = await this
          ._layersProvider
          .layeritems
          .firstWhere((element) => element.id == this._layerID);
      for (var color in layer.mode?.currentColor as List<Color>) {
        var speedTemp = layer.mode?.effects.speed?.round();
        var speed = 0;

        if (speedTemp != null && speedTemp <= 0)
          speed = 0;
        else if (speedTemp != null && speedTemp <= 10)
          speed = 300;
        else if (speedTemp != null && speedTemp <= 20)
          speed = 600;
        else if (speedTemp != null && speedTemp <= 30)
          speed = 900;
        else if (speedTemp != null && speedTemp <= 40)
          speed = 1200;
        else if (speedTemp != null && speedTemp <= 50)
          speed = 1500;
        else if (speedTemp != null && speedTemp <= 60)
          speed = 1800;
        else if (speedTemp != null && speedTemp <= 70)
          speed = 2100;
        else if (speedTemp != null && speedTemp <= 80)
          speed = 2400;
        else if (speedTemp != null && speedTemp <= 90)
          speed = 2700;
        else if (speedTemp != null && speedTemp <= 100) speed = 3000;

        if (speed > 0) currentColor = color;
        await Future.delayed(Duration(milliseconds: 3300 - speed), () => null);
      }
    }
  }
}

class BlinkingEffect extends HardwareEffect {
  var currentColor;
  BlinkingEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider) {
    this.run();
  }

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = this
        ._layersProvider
        .layeritems
        .firstWhere((element) => element.id == this._layerID);
    layer.keys.forEach((key) {
      updateKeyColorInfo(
          keyboard: keyboard, keyName: key.keyCode.name, color: currentColor);
    });
    return keyboard;
  }

  run() async {
    while (true) {
      var layer = await this
          ._layersProvider
          .layeritems
          .firstWhere((element) => element.id == this._layerID);
      currentColor = layer.mode?.currentColor.last;
      var speedTemp = layer.mode?.effects.speed?.round();
      var speed = 0;

      if (speedTemp != null && speedTemp <= 0)
        speed = 0;
      else if (speedTemp != null && speedTemp <= 10)
        speed = 300;
      else if (speedTemp != null && speedTemp <= 20)
        speed = 600;
      else if (speedTemp != null && speedTemp <= 30)
        speed = 900;
      else if (speedTemp != null && speedTemp <= 40)
        speed = 1200;
      else if (speedTemp != null && speedTemp <= 50)
        speed = 1500;
      else if (speedTemp != null && speedTemp <= 60)
        speed = 1800;
      else if (speedTemp != null && speedTemp <= 70)
        speed = 2100;
      else if (speedTemp != null && speedTemp <= 80)
        speed = 2400;
      else if (speedTemp != null && speedTemp <= 90)
        speed = 2700;
      else if (speedTemp != null && speedTemp <= 100) speed = 3000;

      await Future.delayed(Duration(milliseconds: 600),
          () => currentColor = layer.mode?.currentColor.first);
      await Future.delayed(Duration(milliseconds: 3300 - speed), () => null);
    }
  }
}

class ShortcutColorsEffect extends HardwareEffect {
  ShortcutColorsEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider);

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = this
        ._layersProvider
        .layeritems
        .firstWhere((element) => element.id == this._layerID);
    return keyboard;
  }
}

class ImageEffect extends HardwareEffect {
  ImageEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider);

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = this
        ._layersProvider
        .layeritems
        .firstWhere((element) => element.id == this._layerID);

    late int noOfPixelsPerAxis;
    if (layer.keys.length > 64)
      noOfPixelsPerAxis = 9;
    else if (layer.keys.length > 49)
      noOfPixelsPerAxis = 8;
    else if (layer.keys.length > 36)
      noOfPixelsPerAxis = 7;
    else if (layer.keys.length > 25)
      noOfPixelsPerAxis = 6;
    else if (layer.keys.length > 16)
      noOfPixelsPerAxis = 5;
    else
      noOfPixelsPerAxis = 3;
    var imageColors =
        extractPixelsColors(layer.mode?.effects.imageBytes, noOfPixelsPerAxis);

    for (int i = 0; i < layer.keys.length; i++) {
      updateKeyColorInfo(
          keyboard: keyboard,
          keyName: layer.keys[i].keyCode.name,
          color: imageColors[i]);
    }
    return keyboard;
  }

  List<Color> extractPixelsColors(Uint8List? bytes, int noOfPixelsPerAxis) {
    List<Color> colors = [];
    List<int> values = bytes!.buffer.asUint8List();
    imageLib.Image? image = imageLib.decodeImage(values);
    List<int?> pixels = [];

    int? width = image?.width;
    int? height = image?.height;
    int xChunk = width! ~/ (noOfPixelsPerAxis + 1);
    int yChunk = height! ~/ (noOfPixelsPerAxis + 1);

    for (int j = 1; j < noOfPixelsPerAxis + 1; j++) {
      for (int i = 1; i < noOfPixelsPerAxis + 1; i++) {
        int? pixel = image?.getPixel(xChunk * i, yChunk * j);
        pixels.add(pixel);
        colors.add(abgrToColor(pixel!));
      }
    }
    return colors;
  }

  Color abgrToColor(int argbColor) {
    int r = (argbColor >> 16) & 0xFF;
    int b = argbColor & 0xFF;
    int hex = (argbColor & 0xFF00FF00) | (b << 16) | r;
    return Color(hex);
  }
}

class AmbientEffect extends HardwareEffect {
  AmbientEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider);

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    // TODO: implement updateKeyboardInfo
    throw UnimplementedError();
  }
}
