import 'package:flutter/material.dart';

class ThreeColumns extends StatefulWidget {
  const ThreeColumns({
    Key? key,
    this.left,
    this.leftFlex = 2,
    required this.center,
    this.centerFlex = 8,
    this.right,
    this.rightFlex = 2,
  }) : super(key: key);

  final Widget? left;
  final int leftFlex;
  final Widget center;
  final int centerFlex;
  final Widget? right;
  final int rightFlex;

  @override
  State<ThreeColumns> createState() => _ThreeColumnsState();
}

class _ThreeColumnsState extends State<ThreeColumns> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.left != null) ...[
          Expanded(
            flex: widget.leftFlex,
            child: widget.left!,
          ),
          const VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 20,
            endIndent: 0,
          ),
        ],
        Expanded(
          flex: widget.centerFlex,
          child: widget.center,
        ),
        if (widget.right != null) ...[
          const VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 20,
            endIndent: 0,
          ),
          Expanded(
            flex: widget.rightFlex,
            child: widget.right!,
          ),
        ],
      ],
    );
  }
}
