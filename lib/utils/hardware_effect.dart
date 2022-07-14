import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/globals.dart';
import 'package:hpx/providers/keys_provider.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:image/image.dart' as image_lib;
import 'package:provider/provider.dart';

abstract class HardwareEffect {
  final int _layerID;
  final LayersProvider _layersProvider;

  HardwareEffect(this._layerID, this._layersProvider);
  int get layerID => _layerID;

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

  Color interpolate(Color color1, Color color2, double factor) {
    var red = color1.red + ((color2.red - color1.red) * factor);
    var green = color1.green + ((color2.green - color1.green) * factor);
    var blue = color1.blue + ((color2.blue - color1.blue) * factor);
    return Color.fromRGBO(red.round(), green.round(), blue.round(), 100);
  }

  List<Color> generateInterpolation(Color color1, Color color2, int steps) {
    var stepFactor = 1 / (steps - 1);
    List<Color> interpolatedColorArray = [];

    for (var i = 0; i < steps; i++) {
      interpolatedColorArray.add(interpolate(color1, color2, stepFactor * i));
    }
    return interpolatedColorArray;
  }

  List<Color> convertToInterpolated(List<Color> colors) {
    List<Color> interpolatedColorArray = [];

    for (var i = 0; i < colors.length; i++) {
      var next = i + 1;
      if (next >= colors.length) next = 0;

      interpolatedColorArray
          .addAll(generateInterpolation(colors[i], colors[next], 4));
    }

/*
    if(colors.length == 2) {
      interpolatedColorArray = [...generateInterpolation(colors.first, colors.last, 5),
        ...generateInterpolation(colors.last, colors.first, 5)];
    }

    if(colors.length == 3) {
      interpolatedColorArray = [...generateInterpolation(colors[0], colors[1], 3),
      ...generateInterpolation(colors[1], colors[2], 3),
        ...generateInterpolation(colors[2], colors[3], 3),
        ...generateInterpolation(colors[3], colors[0], 3)];
    }

    if(colors.length == 4) {
      interpolatedColorArray = [...generateInterpolation(colors[0], colors[1], 3),
        ...generateInterpolation(colors[1], colors[2], 3),
        ...generateInterpolation(colors[2], colors[3], 3),
        ...generateInterpolation(colors[3], colors[0], 3)];
    }

    if(colors.length == 5) {
      interpolatedColorArray = [...generateInterpolation(colors[0], colors[1], 2),
        ...generateInterpolation(colors[1], colors[2], 2),
        ...generateInterpolation(colors[2], colors[3], 2),
        ...generateInterpolation(colors[3], colors[4], 2),
        ...generateInterpolation(colors[4], colors[0], 2)];
    }

    if(colors.length == 6) {
      interpolatedColorArray = [...generateInterpolation(colors[0], colors[1], 1),
        ...generateInterpolation(colors[1], colors[2], 1),
        ...generateInterpolation(colors[2], colors[3], 1),
        ...generateInterpolation(colors[3], colors[4], 1),
        ...generateInterpolation(colors[4], colors[5], 1),
        ...generateInterpolation(colors[5], colors[0], 1)];
    }

    if(colors.length == 7) {
      interpolatedColorArray = [...generateInterpolation(colors[0], colors[1], 1),
        ...generateInterpolation(colors[1], colors[2], 1),
        ...generateInterpolation(colors[2], colors[3], 1),
        ...generateInterpolation(colors[3], colors[4], 1),
        ...generateInterpolation(colors[4], colors[5], 1),
        ...generateInterpolation(colors[5], colors[6], 1),
        ...generateInterpolation(colors[6], colors[0], 1)];
    }

    if(colors.length == 8) {
      interpolatedColorArray = [...generateInterpolation(colors[0], colors[1], 1),
        ...generateInterpolation(colors[1], colors[2], 1),
        ...generateInterpolation(colors[2], colors[3], 1),
        ...generateInterpolation(colors[3], colors[4], 1),
        ...generateInterpolation(colors[4], colors[5], 1),
        ...generateInterpolation(colors[5], colors[6], 1),
        ...generateInterpolation(colors[6], colors[7], 1),
        ...generateInterpolation(colors[7], colors[8], 1)];
    }*/

    return interpolatedColorArray;
  }
}

class ModeEffect extends HardwareEffect {
  ModeEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider);

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = _layersProvider.layeritems
        .firstWhere((element) => element.id == _layerID);
    for (var key in layer.keys) {
      updateKeyColorInfo(
          keyboard: keyboard,
          keyName: key.keyCode.name,
          color: layer.mode?.currentColor.last);
    }

    return keyboard;
  }
}

class BreathingEffect extends HardwareEffect {
  var currentColor;
  BreathingEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider) {
    run();
  }

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = _layersProvider.layeritems
        .firstWhere((element) => element.id == _layerID);
    for (var key in layer.keys) {
      updateKeyColorInfo(
          keyboard: keyboard, keyName: key.keyCode.name, color: currentColor);
    }
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

      currentColor =
          Color.fromRGBO(incomingRed, incomingGreen, incomingBlue, 100);
      await Future.delayed(const Duration(microseconds: 300), () => null);
    }
  }

  run() async {
    var reverse = false;
    while (true) {
      var layer = _layersProvider.layeritems
          .firstWhere((element) => element.id == _layerID);
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
  late var zones;

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = _layersProvider.layeritems
        .firstWhere((element) => element.id == _layerID);
    for (var key in layer.keys) {
      updateKeyColorInfo(
          keyboard: keyboard,
          keyName: key.keyCode.name,
          color: layer.mode?.currentColor.last);
    }
    return keyboard;
  }
}

class WaveEffect extends HardwareEffect {
  late List<List> zones;
  var currentColors;
  static const MAX_ZONES_COUNT = 8;

  WaveEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider) {
    var layerColors = layersProvider.layeritems
        .firstWhere((element) => element.id == _layerID)
        .mode
        ?.currentColor
        .toList() as List<Color>;
    currentColors = convertToInterpolated(layerColors);
    run();
  }

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    final layer = _layersProvider.layeritems
        .firstWhere((element) => element.id == _layerID);

    var index = 0;
    while (index < zones.length && index < currentColors.length) {
      applyColorToSpecificZone(
          keyboard: keyboard,
          keyboardZone: zones[index],
          color: currentColors[index]);
      index++;
    }
    return keyboard;
  }

  applyColorToSpecificZone(
      {required Map<String, Map<String, Object>> keyboard,
      required List<dynamic> keyboardZone,
      required Color color}) {
    for (var key in keyboardZone) {
      updateKeyColorInfo(keyboard: keyboard, keyName: key, color: color);
    }
  }

  getDividedZones() {
    int smallestIdx = getIdx("smallest");
    int largestIdx = getIdx("largest");

    zones = [[], [], [], [], [], [], [], []];
    var layer = _layersProvider.layeritems
        .firstWhere((element) => element.id == _layerID);
    for (var element in layer.keys) {
      var idx = element.keyColumn - smallestIdx;
      var calculatedZone = zones[idx];
      calculatedZone.add(element.keyCode.name);
    }
  }

  int getIdx(String size) {
    var layer = _layersProvider.layeritems
        .firstWhere((element) => element.id == _layerID);
    var smallestColumn = 100;
    var largestColumn = 0;
    for (var element in layer.keys) {
      if (element.keyColumn < smallestColumn) {
        smallestColumn = element.keyColumn;
      }
      if (element.keyColumn > largestColumn) largestColumn = element.keyColumn;
    }

    if (size == "largest") return largestColumn;
    return smallestColumn;
  }

  run() async {
    while (true) {
      await getDividedZones();
      //currentColors = colors.sublist(0, zones.length);
      //colors.removeRange(0, zones.length);
      await Future.delayed(const Duration(milliseconds: 150), () => null);
      //colors = [...colors, ...currentColors];
      var temp = currentColors.removeLast();
      currentColors.insert(0, temp);
    }
  }
}

class ColorCycleEffect extends HardwareEffect {
  var currentColor;
  ColorCycleEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider) {
    run();
  }

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = _layersProvider.layeritems
        .firstWhere((element) => element.id == _layerID);
    for (var key in layer.keys) {
      updateKeyColorInfo(
          keyboard: keyboard, keyName: key.keyCode.name, color: currentColor);
    }
    return keyboard;
  }

  run() async {
    while (true) {
      var layer = _layersProvider.layeritems
          .firstWhere((element) => element.id == _layerID);
      for (var color in layer.mode?.currentColor as List<Color>) {
        var speedTemp = layer.mode?.effects.speed?.round();
        var speed = 0;

        if (speedTemp != null && speedTemp <= 0) {
          speed = 0;
        } else if (speedTemp != null && speedTemp <= 10) {
          speed = 300;
        } else if (speedTemp != null && speedTemp <= 20) {
          speed = 600;
        } else if (speedTemp != null && speedTemp <= 30) {
          speed = 900;
        } else if (speedTemp != null && speedTemp <= 40) {
          speed = 1200;
        } else if (speedTemp != null && speedTemp <= 50) {
          speed = 1500;
        } else if (speedTemp != null && speedTemp <= 60) {
          speed = 1800;
        } else if (speedTemp != null && speedTemp <= 70) {
          speed = 2100;
        } else if (speedTemp != null && speedTemp <= 80) {
          speed = 2400;
        } else if (speedTemp != null && speedTemp <= 90) {
          speed = 2700;
        } else if (speedTemp != null && speedTemp <= 100) {
          speed = 3000;
        }

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
    run();
  }

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = _layersProvider.layeritems
        .firstWhere((element) => element.id == _layerID);
    for (var key in layer.keys) {
      updateKeyColorInfo(
          keyboard: keyboard, keyName: key.keyCode.name, color: currentColor);
    }
    return keyboard;
  }

  run() async {
    while (true) {
      var layer = _layersProvider.layeritems
          .firstWhere((element) => element.id == _layerID);
      currentColor = layer.mode?.currentColor.last;
      var speedTemp = layer.mode?.effects.speed?.round();
      var speed = 0;

      if (speedTemp != null && speedTemp <= 0) {
        speed = 0;
      } else if (speedTemp != null && speedTemp <= 10) {
        speed = 300;
      } else if (speedTemp != null && speedTemp <= 20) {
        speed = 600;
      } else if (speedTemp != null && speedTemp <= 30) {
        speed = 900;
      } else if (speedTemp != null && speedTemp <= 40) {
        speed = 1200;
      } else if (speedTemp != null && speedTemp <= 50) {
        speed = 1500;
      } else if (speedTemp != null && speedTemp <= 60) {
        speed = 1800;
      } else if (speedTemp != null && speedTemp <= 70) {
        speed = 2100;
      } else if (speedTemp != null && speedTemp <= 80) {
        speed = 2400;
      } else if (speedTemp != null && speedTemp <= 90) {
        speed = 2700;
      } else if (speedTemp != null && speedTemp <= 100) {
        speed = 3000;
      }

      await Future.delayed(const Duration(milliseconds: 600),
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
    var sublayer = _layersProvider.getCurrentSublayer();
    var mainLayer = _layersProvider.layeritems.first;
    var keysProvider =
        Provider.of<KeysProvider>(navigatorKeys.currentContext!, listen: false);
    keysProvider.shortcutKeys.forEach((key, value) {
      for (var element in value) {
        updateKeyColorInfo(
            keyboard: keyboard,
            keyName: element.keyCode.name,
            color: element.topChip!.color);
      }
    });

    return keyboard;
  }
}

class ImageEffect extends HardwareEffect {
  ImageEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider);

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = _layersProvider.layeritems
        .firstWhere((element) => element.id == _layerID);

    late int noOfPixelsPerAxis;
    if (layer.keys.length > 64) {
      noOfPixelsPerAxis = 9;
    } else if (layer.keys.length > 49) {
      noOfPixelsPerAxis = 8;
    } else if (layer.keys.length > 36) {
      noOfPixelsPerAxis = 7;
    } else if (layer.keys.length > 25) {
      noOfPixelsPerAxis = 6;
    } else if (layer.keys.length > 16) {
      noOfPixelsPerAxis = 5;
    } else {
      noOfPixelsPerAxis = 3;
    }
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
    image_lib.Image? image = image_lib.decodeImage(values);
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
      : super(layerID, layersProvider) {
    var color1 = Colors.black;
    var color2 = Colors.white;
    var color3 = generateInterpolation(color1, color2, 8);
    for (var element in color3) {
      print([element.red, element.green, element.blue]);
    }
  }

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    // TODO: implement updateKeyboardInfo
    return keyboard;
  }
}

class SupportContactEffect extends HardwareEffect {
  SupportContactEffect(int layerID, LayersProvider layersProvider)
      : super(layerID, layersProvider) {
    run();
  }

  @override
  Map<String, Map<String, Object>> updateKeyboardInfo(
      Map<String, Map<String, Object>> keyboard) {
    var layer = this
        ._layersProvider
        .layeritems
        .firstWhere((element) => element.id == this._layerID);
    var keys = ["kFn", "kF12"];
    keys.forEach((key) {
      updateKeyColorInfo(
          keyboard: keyboard,
          keyName: key,
          color: layer.mode?.currentColor.last);
    });
    return keyboard;
  }

  run() {
    window.onKeyData = keyEventListener;
  }

  bool keyEventListener(KeyData data) {
    if (data.type == KeyEventType.up && data.physical == 0x70045) {
      _layersProvider.modeProvider?.activateContactSupportDialog();
      return true;
    }
    return false;
  }
}
