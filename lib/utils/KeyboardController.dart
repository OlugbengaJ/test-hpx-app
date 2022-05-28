import 'package:flutter/material.dart';
// import 'package:mongo_dart/mongo_dart.dart';
import 'dart:async';
// import 'dart:math';
import 'package:process_run/shell.dart';

class KeyboardController {
  static final shell = Shell();

  static lightUpAllKeys(
      {required int red, required int green, required int blue}) {
    // shell
    //     .run("python assets/python/main.py --lightUpAllKeys $red $green $blue");
  }

  static lightUpOneKey(
      {required String key,
      required int red,
      required int green,
      required int blue}) {
    // shell.run(
    //     "python assets/python/main.py --lightUpOneKey $key $red $green $blue");
  }

  static lightUpSomeKeys(
      {required List<String> keys,
      required int red,
      required int green,
      required int blue}) {
    // shell.run(
    //     "python assets/python/main.py --lightUpSomeKeys $red $green $blue");
  }

  static blinkEffect({required List<Color> colors, required int speed}) {
    // try {
    //   bool on = false;
    //   Timer.periodic(Duration(milliseconds: speed * 1000), (Timer t) async {
    //     colors.forEach((Color color) {
    //       var red = color.red;
    //       var blue = color.blue;
    //       var green = color.green;
    //       // if (on)
    //       //   shell.run("python assets/python/main.py --lightUpAllKeys 0 0 0");
    //       // else
    //       //   shell.run(
    //       //       "python assets/python/main.py --lightUpAllKeys $red $green $blue");
    //       speed = speed * 1000;
    //       Future.delayed(Duration(milliseconds: (speed / 2) as int));
    //     });
    //     on = !on;
    //   });
    // } catch (e) {
    //   print(e);
    // }
  }

  static breathingEffect({required List<Color> colors, required int speed}) {
    // try {
    //   bool on = false;
    //   Timer.periodic(Duration(milliseconds: speed * 1000), (Timer t) async {
    //     colors.forEach((Color color) {
    //       var red = color.red;
    //       var blue = color.blue;
    //       var green = color.green;
    //       if (on) {
    //       }
    //       // shell.run("python assets/python/main.py --lightUpAllKeys 0 0 0");
    //       else {
    //         var _subspeed = speed * 1000;
    //         /////// write a loop to apply opacity to the color variable and when the opacity is 100%
    //         //////  reset opacity to 0%.
    //         ////// Ensure the loop time is half of the speed been passed

    //         double opacity = 1.00;
    //         for (var i = 0; i < 10; i++) {
    //           opacity -= 0.1;
    //           Color opacityColor = color.withOpacity(opacity);
    //           var _opred = opacityColor.red;
    //           var _opblue = opacityColor.blue;
    //           var _opgreen = opacityColor.green;
    //           // shell.run(
    //           //     "python assets/python/main.py --lightUpAllKeys $_opred $_opgreen $_opblue");
    //         }
    //         _subspeed = (_subspeed / 2) as int;
    //         _subspeed = (_subspeed / 10) as int;
    //         Future.delayed(Duration(milliseconds: _subspeed));
    //       }
    //       speed = speed * 1000;
    //       speed = (speed / 2) as int;
    //       Future.delayed(Duration(milliseconds: speed));
    //     });
    //     on = !on;
    //   });
    // } catch (e) {
    //   print(e);
    // }
  }
}
// 22870455169