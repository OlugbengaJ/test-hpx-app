import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.onTapDown,
    required this.onTapUp,
    this.buttonText,
    this.iconData,
    required this.size,
  }) : super(key: key);

  final VoidCallback onTapDown;
  final VoidCallback onTapUp;
  final String? buttonText;
  final IconData? iconData;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: onTapUp,
          onTapCancel: onTapUp,
          onTapDown: (details) => onTapDown(),
          customBorder: const CircleBorder(),
          splashColor: Theme.of(context).primaryColor,
          child: Icon(
            iconData,
            size: size * 0.7,
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      ),
    );
  }
}
