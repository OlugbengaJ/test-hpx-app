import 'KeyboardDriverWrapper.dart';
import 'dart:math';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';

class KeyboardController {
  static Isolate? isolate;

  static var tempKeys = {
    "escape": {
      "page": 0,
      "index": [0, 1],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "f1": {
      "page": 0,
      "index": [2],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "f2": {
      "page": 0,
      "index": [3],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "f3": {
      "page": 0,
      "index": [4],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "f4": {
      "page": 0,
      "index": [5],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "f5": {
      "page": 0,
      "index": [6],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "f6": {
      "page": 0,
      "index": [7],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "f7": {
      "page": 0,
      "index": [8],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "f8": {
      "page": 0,
      "index": [9],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "f9": {
      "page": 0,
      "index": [10],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "f10": {
      "page": 0,
      "index": [11],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "f11": {
      "page": 0,
      "index": [12],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "f12": {
      "page": 0,
      "index": [13],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "print screen": {
      "page": 0,
      "index": [14],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "power": {
      "page": 0,
      "index": [15],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "delete": {
      "page": 0,
      "index": [16, 17],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "backquote": {
      "page": 0,
      "index": [18, 19],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "1": {
      "page": 0,
      "index": [20],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "2": {
      "page": 0,
      "index": [21],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "3": {
      "page": 0,
      "index": [22],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "4": {
      "page": 0,
      "index": [23],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "5": {
      "page": 0,
      "index": [24],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "6": {
      "page": 0,
      "index": [25],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "7": {
      "page": 0,
      "index": [26],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "8": {
      "page": 0,
      "index": [27],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "9": {
      "page": 0,
      "index": [28],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "0": {
      "page": 0,
      "index": [29],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "dash": {
      "page": 0,
      "index": [30],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "equal": {
      "page": 0,
      "index": [31],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "backspace": {
      "page": 0,
      "index": [32, 33, 34, 35],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "tab": {
      "page": 0,
      "index": [36, 37, 38, 39],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "q": {
      "page": 0,
      "index": [40],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "w": {
      "page": 0,
      "index": [41],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "e": {
      "page": 0,
      "index": [42],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "r": {
      "page": 0,
      "index": [43],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "t": {
      "page": 0,
      "index": [44],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "y": {
      "page": 0,
      "index": [45],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "u": {
      "page": 0,
      "index": [46],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "i": {
      "page": 0,
      "index": [47],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "o": {
      "page": 0,
      "index": [48],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "p": {
      "page": 0,
      "index": [49],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "open bracket": {
      "page": 0,
      "index": [50],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "close bracket": {
      "page": 0,
      "index": [51],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "back slash": {
      "page": 0,
      "index": [52, 53],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "caps lock": {
      "page": 0,
      "index": [54, 55],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "a": {
      "page": 0,
      "index": [56],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "s": {
      "page": 0,
      "index": [57],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "d": {
      "page": 0,
      "index": [58],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "f": {
      "page": 0,
      "index": [59],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "g": {
      "page": 1,
      "index": [60],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "h": {
      "page": 1,
      "index": [61],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "j": {
      "page": 1,
      "index": [62],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "k": {
      "page": 1,
      "index": [63],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "l": {
      "page": 1,
      "index": [64],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "semi-colon": {
      "page": 1,
      "index": [65],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "single quote": {
      "page": 1,
      "index": [66],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "enter": {
      "page": 1,
      "index": [67, 68, 69, 70],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "left shift": {
      "page": 1,
      "index": [71, 72, 73, 74],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "z": {
      "page": 1,
      "index": [75],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "x": {
      "page": 1,
      "index": [76],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "c": {
      "page": 1,
      "index": [77],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "v": {
      "page": 1,
      "index": [78],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "b": {
      "page": 1,
      "index": [79],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "n": {
      "page": 1,
      "index": [80],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "m": {
      "page": 1,
      "index": [81],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "comma": {
      "page": 1,
      "index": [82],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "dot": {
      "page": 1,
      "index": [83],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "forward slash": {
      "page": 1,
      "index": [84],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "right shift": {
      "page": 1,
      "index": [85, 86, 87, 88],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "left ctrl": {
      "page": 1,
      "index": [89],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "fn": {
      "page": 1,
      "index": [90],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "left window key": {
      "page": 1,
      "index": [91],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "left alt": {
      "page": 1,
      "index": [92],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "space": {
      "page": 1,
      "index": [93, 94, 95, 96, 97, 98],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "right alt": {
      "page": 1,
      "index": [99],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "right ctrl": {
      "page": 1,
      "index": [100],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "left arrow": {
      "page": 1,
      "index": [101],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "up arrow": {
      "page": 1,
      "index": [102],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "down arrow": {
      "page": 1,
      "index": [103],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "right arrow": {
      "page": 1,
      "index": [104],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    }
  };

  static powerKeyboardOff() {
    KeyboardDriverWrapper.powerKeyboardOff();
  }

  static powerKeyboardOn() {
    KeyboardDriverWrapper.powerKeyboardOn();
  }

  static imageEffect(LayerItemModel layer) {
    //var imageMatrix = layer.mode?.effects?.extractedColors;
    //KeyboardDriverWrapper.imageEffect(imageMatrix);
  }

  static modeEffect(LayerItemModel layer) {
    var color = layer.mode?.currentColor.first;
    KeyboardDriverWrapper.setAllKeysSpecificColor(color: color);
  }

  static shortcutColorEffect(LayerItemModel layer) {
    KeyboardDriverWrapper.setSpecificKeysSpecificColors([
      ["right arrow", 255, 255, 255],
      ["enter", 255, 255, 255],
    ]);
  }

  static blinkingEffect(LayerItemModel layer) {
    KeyboardDriverWrapper.blinkingEffect(
        colors: layer.mode?.currentColor as List<Color>,
        primaryColorSpeed: 3000,
        blinkingColorSpeed: 900);
  }

  static waveEffect(LayerItemModel layer) {
    var colors = layer.mode?.currentColor;
    KeyboardDriverWrapper.waveEffect(colors as List<Color>, 300);
  }

  static colorCycleEffect(LayerItemModel layer) {
    var colors = layer.mode?.currentColor;
    KeyboardDriverWrapper.colorCycleEffect(colors as List<Color>, 100);
  }

  static breathingEffect(LayerItemModel layer) {
    var colors = layer.mode?.currentColor;
    KeyboardDriverWrapper.breathingEffect(colors as List<Color>);
  }

  static colorProductionEffect(LayerItemModel layer) {
    var color = layer.mode?.currentColor.first;
    KeyboardDriverWrapper.colorProductionEffect(color);
  }

  static moodEffect(LayerItemModel layer) {
    var color = layer.mode?.currentColor.first;
    KeyboardDriverWrapper.moodEffect(color: color);
  }

  static cleanUpOldEffect() {
    if (isolate != null) {
      isolate?.kill();
    }
  }
}
