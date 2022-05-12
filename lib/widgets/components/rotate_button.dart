import 'package:flutter/material.dart';
import 'dart:math';

class RotateButton extends StatefulWidget {
  RotateButton({Key? key, required this.onChange}) : super(key: key);

  final Function(double? angle) onChange;
  double? value = 0.00;

  @override
  _RotateButtonState createState() => _RotateButtonState();
}

class _RotateButtonState extends State<RotateButton> {
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: angle,
          alignment: Alignment.center,
          child: GestureDetector(
            onPanUpdate: (details) => setState(() {
              angle = details.localPosition.direction;
              widget.onChange(details.localPosition.direction);
            }),
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                  color: Colors.black45, shape: BoxShape.circle),
              alignment: Alignment.topCenter,
              child: Container(
                width: 5,
                height: 20,
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.rectangle),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
