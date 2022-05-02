import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  /// RoundButton provides a customizable button that accepts icon
  /// and color which keeps the entire app consistent.
  const RoundButton({
    Key? key,
    required this.onTapDown,
    required this.onTapUp,
    required this.size,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  final VoidCallback onTapDown;
  final VoidCallback onTapUp;
  final double size;
  final IconData? icon;
  final Color? iconColor;

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
            icon,
            size: size * 0.7, // reduced icon size to 70% to show tap effect
            color: iconColor ?? Theme.of(context).primaryColorLight,
          ),
        ),
      ),
    );
  }
}
