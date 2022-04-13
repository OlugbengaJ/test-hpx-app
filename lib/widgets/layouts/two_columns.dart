import 'package:flutter/material.dart';

class TwoColums extends StatefulWidget {
  const TwoColums({ Key? key, 
    required this.left,
    this.leftFlex=2,
    required this.right,
    this.rightFlex=2,
  
  }) : super(key: key);
  final Widget left;
  final int leftFlex;
  final Widget right;
  final int rightFlex;

  @override
  State<TwoColums> createState() => _TwoColumsState();
}

class _TwoColumsState extends State<TwoColums> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: widget.leftFlex,
          child: widget.left,
        ),
        Expanded(
          flex: widget.rightFlex,
          child: widget.right,
        ),
      ],
    );
  }
}