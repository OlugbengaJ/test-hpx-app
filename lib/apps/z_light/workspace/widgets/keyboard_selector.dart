import 'package:flutter/material.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:provider/provider.dart';

class KeyboardSelector extends StatelessWidget {
  const KeyboardSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkspaceProvider>(
      builder: (context, value, child) => Positioned(
        left: value.leftZonePosition,
        top: value.topZonePosition,
        child: Container(
          margin: EdgeInsets.zero,
          height: value.zoneHeight,
          width: value.zoneWidth,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
