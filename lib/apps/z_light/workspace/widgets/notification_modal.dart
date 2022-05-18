import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/round_button.dart';

class ModalNotification extends StatelessWidget {
  /// [ModalNotification] display a modal at the center of the screen.
  ///
  /// [closeHandler] is a callback funtion required to close the window.
  const ModalNotification({
    Key? key,
    this.color,
    required this.children,
    required this.closeHandler,
  }) : super(key: key);

  /// [color] sets the background color.
  final Color? color;

  /// [children] are widgets that will be added to the modal stack.
  final List<Widget> children;

  /// [closeHandler] closes the notification modal.
  final VoidCallback closeHandler;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.all(15.0),
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
            color: color ?? Theme.of(context).primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Tooltip(
                  message: 'Close',
                  child: RoundButton(
                    onTapDown: closeHandler,
                    onTapUp: () {},
                    size: 24,
                    icon: Icons.close,
                    iconColor: Theme.of(context).primaryColorLight,
                  ),
                ),
              ),
              // stack up child widgets
              Expanded(
                child: Container(
                  margin: EdgeInsets.zero,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    primary: false,
                    padding: EdgeInsets.zero,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: children,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
