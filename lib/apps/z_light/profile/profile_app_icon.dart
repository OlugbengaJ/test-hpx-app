import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hpx/utils/constants.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({Key? key, required this.icon, this.size = 50.0})
      : super(key: key);

  final String icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (icon.isEmpty) {
      return Image.asset(
        Constants.zImage,
        width: size,
        height: size,
      );
    }

    return Image.memory(
      File(icon).readAsBytesSync(),
      width: size,
      height: size,
    );
  }
}
