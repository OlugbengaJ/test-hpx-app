import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    this.buttonText,
    this.iconData,
    required this.onPressed,
    required this.size,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? buttonText;
  final IconData? iconData;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      // label: Text(buttonText ?? ''),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(size, size),
        padding: const EdgeInsets.all(0),
        shape: const CircleBorder(),
      ),
      child: Icon(
        iconData,
        size: size,
      ),
    );
  }
}
