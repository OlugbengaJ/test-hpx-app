import 'package:flutter/material.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:provider/provider.dart';

class ThreeColumns extends StatefulWidget {
  const ThreeColumns({
    Key? key,
    required this.leftWidget,
    this.leftFlex = 2,
    required this.centerWidget,
    this.centerFlex = 8,
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
      children: [
        Consumer<WorkspaceProvider>(
          builder: (context, value, child) => (value.showLighting)
              ? Expanded(
                  flex: widget.leftFlex,
                  child: widget.leftWidget,
                )
              : Container(),
        ),
        Consumer<WorkspaceProvider>(
          builder: (context, value, child) => (value.showLighting)
              ? const VerticalDivider(
                  width: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 0,
                )
              : Container(),
        ),
        // Center widget does not consume WorkspaceProvider to prevent recreating
        Expanded(
          flex: widget.centerFlex,
          child: widget.centerWidget,
        ),
        Consumer<WorkspaceProvider>(
          builder: (context, value, child) => (value.showLighting)
              ? const VerticalDivider(
                  width: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 0,
                )
              : Container(),
        ),
        Consumer<WorkspaceProvider>(
          builder: (context, value, child) => (value.showLighting)
              ? Expanded(
                  flex: widget.rightFlex,
                  child: widget.rightWidget,
                )
              : Container(),
        ),
      ],
    );
  }
}
