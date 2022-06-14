import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class KeyboardDriverWrapper {
  static const _outputFilePath = "/dev/usb/rgb_kbd2";
  static String runningEffectName = "";
  static List<Color>? colorCycleleColors;
  static List<Color>? waveColors;
  static List<Color>? blinkingColors;
  static List<Color>? breathingColors;

  ///Singleton design pattern, so that this class cannot be instantiated
  KeyboardDriverWrapper._();

  static final KeyboardDriverWrapper instance = KeyboardDriverWrapper._();
  static late File _outputFile;

  static var keyboardKeys = {
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

  ///Open a file in write mode and returns it
  static File get outputFile {
    _outputFile = File(_outputFilePath);
    return _outputFile;
  }

  ///Turns the keyboard light on
  static powerKeyboardOn() async {
    await outputFile.writeAsString("SPO", flush: true);
  }

  ///Turns the keyboard light off
  static powerKeyboardOff() async {
    await outputFile.writeAsString("SPF", flush: true);
  }

  ///Sets all the keys on the keyboard to the red
  static setAllKeysRed() async {
    await outputFile.writeAsString("SAR", flush: true);
  }

  ///Sets all the keys on the keyboard to the green
  static setAllKeysGreen() async {
    await outputFile.writeAsString("SAG", flush: true);
  }

  ///Sets all the keys on the keyboard to the blue
  static setAllKeysBlue() async {
    await outputFile.writeAsString("SAB", flush: true);
  }

  ///Sets  all the keys on the keyboard to the specified hex color
  ///@funcParameter: rgb color codes for red, green abd blue
  static setAllKeysSpecificColor({required Color color}) async {
    await outputFile
        .writeAsBytes([83, 65, 83, color.red, color.green, color.blue]);
  }

  static setSpecificKeysSpecificColors(
      List<List<dynamic>> keyAndColorList) async {
    List<int> completeByteArray = [];

    //Update color information for each key in the keyboardKyes json object
    for (var keyAndColor in keyAndColorList) {
      updateKeyColorInfo(
          keyName: keyAndColor[0],
          redOpacity: keyAndColor[1],
          greenOpacity: keyAndColor[2],
          blueOpacity: keyAndColor[3]);
    }

    //SAC command for the driver
    completeByteArray.add(83);
    completeByteArray.add(65);
    completeByteArray.add(67);

    completeByteArray = [
      ...completeByteArray,
      ...composeSpecificColorCompletePacket()
    ];
    print(completeByteArray);
    await outputFile.writeAsBytes(completeByteArray);
  }

  static updateKeyColorInfo(
      {required String keyName,
        required int redOpacity,
        required int greenOpacity,
        required int blueOpacity}) {
    keyboardKeys[keyName]!["redOpacity"] = redOpacity;
    keyboardKeys[keyName]!["greenOpacity"] = greenOpacity;
    keyboardKeys[keyName]!["blueOpacity"] = blueOpacity;
  }

  static composeSpecificColorSubPacket({required String colorName}) {
    var subPacketByteArray = List<int>.filled(180, 0, growable: false);
    keyboardKeys.forEach((key, value) {
      for (int index in value["index"] as List) {
        if (colorName == "red") {
          subPacketByteArray[index] = value["redOpacity"] as int;
        } else if (colorName == "green")
          subPacketByteArray[index] = value["greenOpacity"] as int;
        else if (colorName == "blue")
          subPacketByteArray[index] = value["blueOpacity"] as int;
      }
    });

    return subPacketByteArray;
  }

  static composeSpecificColorCompletePacket() {
    var completePacketByteArray = [];
    completePacketByteArray
        .addAll(composeSpecificColorSubPacket(colorName: "red"));
    completePacketByteArray
        .addAll(composeSpecificColorSubPacket(colorName: "green"));
    completePacketByteArray
        .addAll(composeSpecificColorSubPacket(colorName: "blue"));

    return completePacketByteArray;
  }

  static breathingEffect(List<Color> colors) async {
    breathingColors = colors;
    if(runningEffectName == "breathingEffect") return;
    runningEffectName = "breathingEffect";

    while (runningEffectName == "breathingEffect") {
      await fadeTransition(breathingColors!.first, breathingColors!.last);
      var temp = breathingColors!.last;
      breathingColors!.last = breathingColors!.first;
      breathingColors!.first = temp;
      await Future.delayed(Duration(milliseconds: 1000), () => null);
    }
  }

  ///Sets the keyboard rgb to blinking effect
  ///primaryColorSpeed -set in milliseconds, determines how long the primary color stays on
  ///blinkingColorSpeed - set in milliseconds, determines how fast the blinking is
  static blinkingEffect(
      {required List<Color> colors,
        required int primaryColorSpeed,
        required int blinkingColorSpeed})  async {

    blinkingColors = colors;
    if(runningEffectName == "blinkingEffect") return;
    runningEffectName = "blinkingEffect";

    while (runningEffectName == "blinkingEffect") {
      await Future.delayed(
          Duration(milliseconds: primaryColorSpeed),
              () => setAllKeysSpecificColor(color: blinkingColors!.last));
      await Future.delayed(
          Duration(milliseconds: blinkingColorSpeed),
              () => setAllKeysSpecificColor(color: blinkingColors!.first));
    }
  }

  static waveEffect(List<Color> colors, int waveSpeed) async {
    waveColors = colors;

    if(runningEffectName == "waveEffect") return;
    runningEffectName = "waveEffect";
    var zone1 = [
      "escape",
      "backquote",
      "tab",
      "caps lock",
      "left shift",
      "left ctrl",
      "f1",
      "1",
      "q",
      "a",
      "fn"
    ];
    var zone2 = [
      "f2",
      "2",
      "w",
      "s",
      "z",
      "left window key",
      "f3",
      "3",
      "e",
      "d",
      "x",
      "left alt"
    ];
    var zone3 = ["f4", "4", "r", "f", "c", "f5", "5", "t", "g", "v"];
    var zone4 = ["f6", "6", "y", "h", "b", "f7", "7", "u", "j", "n", "f8"];
    var zone5 = [
      "f9",
      "8",
      "i",
      "k",
      "m",
      "f10",
      "9",
      "o",
      "l",
      "comma",
      "right alt",
      "0",
      "dot",
      "right ctrl"
    ];
    var zone6 = [
      "f11",
      "dash",
      "p",
      "semi-colon",
      "forward slash",
      "left arrow",
      "f12",
      "print screen",
      "equal",
      "open bracket",
      "single quote",
      "up arrow",
      "down arrow"
    ];
    var zone7 = [
      "power",
      "close bracket",
      "delete",
      "backspace",
      "back slash",
      "enter",
      "right shift",
      "right arrow"
    ];

    var zones = [zone1, zone2, zone3, zone4, zone5, zone6, zone7];

    while (runningEffectName == "waveEffect") {
      waveEffectImpl(zones, waveColors!);
      var color = waveColors?.last;
      waveColors?.removeLast();
      waveColors?.insert(0, color!);
      await Future.delayed(
          Duration(milliseconds: 1000 - waveSpeed as int), () => null);
    }
  }

  static waveEffectImpl(List<List<String>> zones, List<Color> colors) async {
    var index = 0;
    while (index < zones.length && index < colors.length) {
      applyColorToSpecificZone(
          keyboardZone: zones[index], color: colors[index]);
      index++;
    }

    List<int> completeByteArray = [];
    completeByteArray.add(83);
    completeByteArray.add(65);
    completeByteArray.add(67);
    completeByteArray = [
      ...completeByteArray,
      ...composeSpecificColorCompletePacket()
    ];
    await outputFile.writeAsBytes(completeByteArray);
  }

  static applyColorToSpecificZone(
      {required List<String> keyboardZone, required Color color}) {
    keyboardZone.forEach((element) {
      updateKeyColorInfo(
          keyName: element,
          redOpacity: color.red,
          greenOpacity: color.green,
          blueOpacity: color.blue);
    });
  }

  static colorCycleEffect(List<Color> colors, int cycleSpeed) async {
    colorCycleleColors = colors;
    if(runningEffectName == "colorCycleEffect") return;
    runningEffectName = "colorCycleEffect";

    while (runningEffectName == "colorCycleEffect") {
      for (var color in colorCycleleColors!) {
        setAllKeysSpecificColor(color: color);
        await Future.delayed(
            Duration(milliseconds: 1000 - cycleSpeed as int), () => null);
      }
    }
  }

  static fadeTransition(Color fromColor, Color toColor) async {
    int incomingRed = fromColor.red;
    int incomingGreen = fromColor.green;
    int incomingBlue = fromColor.blue;

    while (
    runningEffectName == "breathingEffect" && incomingRed != toColor.red ||
        runningEffectName == "breathingEffect" && incomingGreen != toColor.green ||
        runningEffectName == "breathingEffect" && incomingBlue != toColor.blue) {
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

      await setAllKeysSpecificColor(color: Color.fromRGBO(incomingRed, incomingGreen, incomingBlue, 100));
      //await Future.delayed(Duration(microseconds: 100), () => null);
    }
  }

  static imageEffect(List<List<Color>> imageMatrix) async {
    //var imageMatrix = [[Color(0x00000000), Color(0xff0096d6), Color(0x00000000), Color(0xff0096d6), Color(0xff0096d6), Color(0x00000000)], [Color(0xff0096d6), Color(0x8c002d41), Color(0xff0096d6), Color(0xff0096d6), Color(0xff0096d6), Color(0xff0096d6)], [Color(0xff0096d6), Color(0x00000000), Color(0x00000000), Color(0xff0096d6), Color(0xff0096d6), Color(0x00000000)], [Color(0xff0096d6), Color(0xff0094d5), Color(0x00000000), Color(0x00000000), Color(0x00000000), Color(0xff0096d6)], [Color(0xff0096d6), Color(0xff0096d6), Color(0xff0096d6), Color(0x00000000), Color(0xff0096d6), Color(0xff0096d6)], [Color(0x00000000), Color(0xff0096d6), Color(0xc300577c), Color(0xff0096d6), Color(0xff0096d6), Color(0x00000000)]];

    var row1 = ["f5", "f6", "f7", "f8", "f9", "f10"];
    var row2 = ["4", "5", "6", "7", "8", "9"];
    var row3 = ["r", "t", "y", "u", "i", "o"];
    var row4 = ["d", "f", "g", "h", "j", "k"];
    var row5 = ["c", "v", "b", "n", "m", "comma"];

    //var colors =[Colors.green, Colors.green, Colors.white, Colors.white, Colors.green, Colors.green];
    var rows = [row1, row2, row3, row4, row5];

    for(var rowAndColors in IterableZip([rows, imageMatrix])) {
      var index = 0;
      var colors = rowAndColors[1] as List<Color>;
      var row = rowAndColors[0] as List<String>;
      while(index < colors.length) {
        var c = colors[index];
        var k = row[index];
        updateKeyColorInfo(keyName: k, redOpacity: c.red, greenOpacity: c.green, blueOpacity: c.blue);
        index++;
      }


    }


    List<int> completeByteArray = [];
    completeByteArray.add(83);
    completeByteArray.add(65);
    completeByteArray.add(67);
    completeByteArray = [
      ...completeByteArray,
      ...composeSpecificColorCompletePacket()
    ];
    await outputFile.writeAsBytes(completeByteArray);

  }

  static audioVisualizerEffect() {
    var data = File("assets/audio.json").readAsString();
    print(data);
  }

  static colorProductionEffect(Color color) {
    runningEffectName = "colorProductionEffect";
    setAllKeysSpecificColor(color: color);
  }

  static moodEffect({required Color color}) {
    runningEffectName = "moodEffect";
    setAllKeysSpecificColor(color: color);
  }
}