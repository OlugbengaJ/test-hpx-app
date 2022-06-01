import 'package:flutter/material.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:provider/provider.dart';

class KeyboardSelector extends StatelessWidget {
  const KeyboardSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkspaceProvider>(
      builder: (context, value, child) => Positioned(
        left: value.zoneL,
        top: value.zoneT,
        child: Container(
          margin: EdgeInsets.zero,
          height: value.zoneH,
          width: value.zoneW,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
