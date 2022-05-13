import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/round_button.dart';

class ModalNotification extends StatelessWidget {
  /// [ModalNotification] display a modal at the center of the screen.
  ///
  /// [closeHandler] is a callback funtion required to close the window.
  const ModalNotification({
    Key? key,
    required this.children,
    required this.closeHandler,
  }) : super(key: key);

  final List<Widget> children;
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
          // constraints: BoxConstraints(maxHeight: maxHeight, maxWidth: maxWidth),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
            color: Colors.white.withOpacity(0.6),
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
                    iconColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              // stack up child widgets
              ...children,
            ],
          ),
        ),
      ],
    );
    //   ],
    // );
  }
}
