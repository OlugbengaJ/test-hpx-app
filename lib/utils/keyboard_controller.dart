import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/utils/hardware_effect.dart';
import 'dart:isolate';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/utils/keyboard_driver_wrapper.dart';

class KeyboardController {
  Isolate? isolate;
  List<HardwareEffect> runningEffects = [];
  int overallEffectsSpeed = 600;
  LayersProvider layersProvider;
  var keyboardKeys = {
    "kEsc": {
      "page": 0,
      "index": [0, 1],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kF1": {
      "page": 0,
      "index": [2],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kF2": {
      "page": 0,
      "index": [3],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kF3": {
      "page": 0,
      "index": [4],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kF4": {
      "page": 0,
      "index": [5],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kF5": {
      "page": 0,
      "index": [6],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kF6": {
      "page": 0,
      "index": [7],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kF7": {
      "page": 0,
      "index": [8],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kF8": {
      "page": 0,
      "index": [9],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kF9": {
      "page": 0,
      "index": [10],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kF10": {
      "page": 0,
      "index": [11],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kF11": {
      "page": 0,
      "index": [12],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kF12": {
      "page": 0,
      "index": [13],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kCam": {
      "page": 0,
      "index": [14],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kPower": {
      "page": 0,
      "index": [15],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kDelete": {
      "page": 0,
      "index": [16, 17],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kTilda": {
      "page": 0,
      "index": [18, 19],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "k1": {
      "page": 0,
      "index": [20],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "k2": {
      "page": 0,
      "index": [21],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "k3": {
      "page": 0,
      "index": [22],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "k4": {
      "page": 0,
      "index": [23],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "k5": {
      "page": 0,
      "index": [24],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "k6": {
      "page": 0,
      "index": [25],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "k7": {
      "page": 0,
      "index": [26],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "k8": {
      "page": 0,
      "index": [27],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "k9": {
      "page": 0,
      "index": [28],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "k0": {
      "page": 0,
      "index": [29],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kDash": {
      "page": 0,
      "index": [30],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kEquals": {
      "page": 0,
      "index": [31],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kBackspace": {
      "page": 0,
      "index": [32, 33, 34, 35],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kTab": {
      "page": 0,
      "index": [36, 37, 38, 39],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kQ": {
      "page": 0,
      "index": [40],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kW": {
      "page": 0,
      "index": [41],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kE": {
      "page": 0,
      "index": [42],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kR": {
      "page": 0,
      "index": [43],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kT": {
      "page": 0,
      "index": [44],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kY": {
      "page": 0,
      "index": [45],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kU": {
      "page": 0,
      "index": [46],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kI": {
      "page": 0,
      "index": [47],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kO": {
      "page": 0,
      "index": [48],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kP": {
      "page": 0,
      "index": [49],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kBracketLeft": {
      "page": 0,
      "index": [50],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kBracketRight": {
      "page": 0,
      "index": [51],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kBackSlash": {
      "page": 0,
      "index": [52, 53],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kCaps": {
      "page": 0,
      "index": [54, 55],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kA": {
      "page": 0,
      "index": [56],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kS": {
      "page": 0,
      "index": [57],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kD": {
      "page": 0,
      "index": [58],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kF": {
      "page": 0,
      "index": [59],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kG": {
      "page": 1,
      "index": [60],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kH": {
      "page": 1,
      "index": [61],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kJ": {
      "page": 1,
      "index": [62],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kK": {
      "page": 1,
      "index": [63],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kL": {
      "page": 1,
      "index": [64],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kColon": {
      "page": 1,
      "index": [65],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kQuote": {
      "page": 1,
      "index": [66],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kEnter": {
      "page": 1,
      "index": [67, 68, 69, 70],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kShiftLeft": {
      "page": 1,
      "index": [71, 72, 73, 74],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kZ": {
      "page": 1,
      "index": [75],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kX": {
      "page": 1,
      "index": [76],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kC": {
      "page": 1,
      "index": [77],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kV": {
      "page": 1,
      "index": [78],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kB": {
      "page": 1,
      "index": [79],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kN": {
      "page": 1,
      "index": [80],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kM": {
      "page": 1,
      "index": [81],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kComma": {
      "page": 1,
      "index": [82],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kPeriod": {
      "page": 1,
      "index": [83],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kForwardSlash": {
      "page": 1,
      "index": [84],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kShiftRight": {
      "page": 1,
      "index": [85, 86, 87, 88],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kCtrlLeft": {
      "page": 1,
      "index": [89],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kFn": {
      "page": 1,
      "index": [90],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kWin": {
      "page": 1,
      "index": [91],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kAltLeft": {
      "page": 1,
      "index": [92],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kSpacebar": {
      "page": 1,
      "index": [93, 94, 95, 96, 97, 98],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kAltRight": {
      "page": 1,
      "index": [99],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kCrtlRight": {
      "page": 1,
      "index": [100],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kArrowLeft": {
      "page": 1,
      "index": [101],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kArrowUp": {
      "page": 1,
      "index": [102],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kArrowDown": {
      "page": 1,
      "index": [103],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    },
    "kArrowRight": {
      "page": 1,
      "index": [104],
      "redOpacity": 0,
      "greenOpacity": 0,
      "blueOpacity": 0
    }
  };

  KeyboardController(this.layersProvider) {
    run(overallEffectsSpeed);
  }

  addLayer(LayerItemModel layer) {
    removeLayer(layer);

    switch (layer.mode?.name) {
      case "Color Production":
        {
          runningEffects.add(ColorProductionEffect(layer.id, layersProvider));
        }
        break;

      case "Mood":
        {
          runningEffects.add(ModeEffect(layer.id, layersProvider));
        }
        break;

      case "Wave":
        {
          runningEffects.add(WaveEffect(layer.id, layersProvider));
        }
        break;

      case "Color Cycle":
        {
          runningEffects.add(ColorCycleEffect(layer.id, layersProvider));
        }
        break;

      case "Breathing":
        {
          runningEffects.add(BreathingEffect(layer.id, layersProvider));
        }
        break;

      case "Blinking":
        {
          runningEffects.add(BlinkingEffect(layer.id, layersProvider));
        }
        break;

      case "Shortcut Colors":
        {
          runningEffects.add(ShortcutColorsEffect(layer.id, layersProvider));
        }
        break;

      case "Image":
        {
          runningEffects.add(ImageEffect(layer.id, layersProvider));
        }
        break;

      case "Contact Support":
        {
          runningEffects.add(SupportContactEffect(layer.id, layersProvider));
        }
        break;

      default:
        {}
        break;
    }
  }

  removeLayer(LayerItemModel layer) {
    runningEffects.removeWhere((element) => element.layerID == layer.id);
  }

  applyEffectToKeys() {
    for (var effect in runningEffects) {
      keyboardKeys = effect.updateKeyboardInfo(keyboardKeys);
    }
  }

  sendCombinedCommandToDriver() {
    applyEffectToKeys();
    KeyboardDriverWrapper.writeCombinedCommand(getCombinedCommand());
  }

  List<int> getCombinedCommand() {
    List<int> completeByteArray = [];
    completeByteArray.add(83);
    completeByteArray.add(65);
    completeByteArray.add(67);
    completeByteArray = [...completeByteArray, ...composeCombinedCommand()];
    return completeByteArray;
  }

  composeCombinedCommand() {
    var completePacketByteArray = [];
    completePacketByteArray.addAll(composeSubCommand(colorName: "red"));
    completePacketByteArray.addAll(composeSubCommand(colorName: "green"));
    completePacketByteArray.addAll(composeSubCommand(colorName: "blue"));

    return completePacketByteArray;
  }

  composeSubCommand({required String colorName}) {
    var subPacketByteArray = List<int>.filled(180, 0, growable: false);
    keyboardKeys.forEach((key, value) {
      for (int index in value["index"] as List) {
        if (colorName == "red") {
          subPacketByteArray[index] = value["redOpacity"] as int;
        } else if (colorName == "green") {
          subPacketByteArray[index] = value["greenOpacity"] as int;
        } else if (colorName == "blue") {
          subPacketByteArray[index] = value["blueOpacity"] as int;
        }
      }
    });

    return subPacketByteArray;
  }

  Future<void> run(int speed) async {
    while (true) {
      await sendCombinedCommandToDriver();
      resetKeysForNewCommand();
      await Future.delayed(Duration(milliseconds: 1000 - speed), () => null);
    }
  }

  void resetKeysForNewCommand() {
    keyboardKeys.forEach((key, value) {
      value["redOpacity"] = 0;
      value["greenOpacity"] = 0;
      value["blueOpacity"] = 0;
    });
  }
}