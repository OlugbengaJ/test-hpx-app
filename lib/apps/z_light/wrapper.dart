import 'package:flutter/material.dart';

import 'layers/layers.dart';


class Wrapper extends StatefulWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: const [
            Expanded(
              flex: 2,
              child: Layers(),
            ),
            Expanded(
              flex: 8,
              child: Text("Workspace"),
            ),
            Expanded(
              flex: 2,
              child: Text("Tools effects"),
            ),
          ],
        ),
      ),
    );
  }
}