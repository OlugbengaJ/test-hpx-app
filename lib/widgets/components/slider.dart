import 'package:flutter/material.dart';

class SliderComponent extends StatefulWidget {
  SliderComponent(
      {Key? key,
      required this.onChange,
      required this.label,
      required this.slideValue,
      this.maxValue,
      this.division})
      : super(key: key);
  Function(double value) onChange;
  double slideValue = 0;
  double? maxValue = 100;
  int? division = 100;
  String? label;

  @override
  State<SliderComponent> createState() => _SliderComponent();
}

class _SliderComponent extends State<SliderComponent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Slider(
      value: widget.slideValue,
      max: widget.maxValue!,
      min: 0,
      divisions: widget.division!,
      label: widget.label,
      onChanged: (double value) {
        widget.onChange(value);
      },
    ));
  }
}
