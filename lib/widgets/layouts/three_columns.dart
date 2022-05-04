import 'package:flutter/material.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:provider/provider.dart';

class ThreeColumns extends StatefulWidget {
  const ThreeColumns({
    Key? key,
    required this.leftWidget,
    this.leftFlex = 2,
    required this.centerWidget,
    this.centerFlex = 5,
    required this.rightWidget,
    this.rightFlex = 2,
  }) : super(key: key);

  final Widget leftWidget;
  final int leftFlex;
  final Widget centerWidget;
  final int centerFlex;
  final Widget rightWidget;
  final int rightFlex;

  @override
  State<ThreeColumns> createState() => _ThreeColumnsState();
}

/// Widget consumes a WorkspaceProvider only at regions that need to change on view selection.
///
/// Avoid wrapping the entire return widget with Consumer as that will reinitialize
/// the center widget causing unexpected behavior e.g. the zoom state is lost.
class _ThreeColumnsState extends State<ThreeColumns> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Consumer<WorkspaceProvider>(
          builder: (context, value, child) => value.isLightingView
              ? Expanded(
                  // flex: widget.leftFlex,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: widget.leftWidget,
                  ),
                )
              : const SizedBox(width: 0, child: null),
        ),
        // Center widget does not consume WorkspaceProvider to prevent recreating
        Expanded(
          flex: 3, //widget.centerFlex,
          child: widget.centerWidget,
        ),
        Consumer<WorkspaceProvider>(
          builder: (context, value, child) => value.isLightingView
              ? Expanded(
                  // flex: widget.rightFlex,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: widget.rightWidget,
                  ),
                )
              : const SizedBox(width: 0, child: null),
        ),
      ],
    );
  }
}
