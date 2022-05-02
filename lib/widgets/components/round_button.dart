import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    this.background = Colors.white,
    this.iconData,
    required this.onPressed,
    required this.size,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color? background;
  final IconData? iconData;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.white,
        fixedSize: Size(size, size),
        padding: const EdgeInsets.all(0),
        shape: const CircleBorder(),
      ),
      child: Icon(
        iconData,
        size: size,
        color: Colors.black,
      ),
    );
  }
}
