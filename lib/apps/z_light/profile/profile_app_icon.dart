import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hpx/utils/constants.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({Key? key, required this.iconPath, this.size = 50.0})
      : super(key: key);

  final String iconPath;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (iconPath.isEmpty) {
      return Image.asset(
        Constants.zlightIcon, //.zImage,
        width: size,
        height: size,
      );
    }

    if (iconPath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.file(
        File(iconPath),
        width: size,
        height: size,
      );
    }

    return Image.memory(
      File(iconPath).readAsBytesSync(),
      width: size,
      height: size,
    );
  }
}
