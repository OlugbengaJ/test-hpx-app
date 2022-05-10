import 'package:flutter/material.dart';

class Notification extends StatelessWidget {
  const Notification({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: children,
    );
  }
}
