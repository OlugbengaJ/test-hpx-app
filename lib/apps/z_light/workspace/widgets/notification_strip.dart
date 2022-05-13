import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/round_button.dart';

class StripNotification extends StatelessWidget {
  const StripNotification({
    Key? key,
    this.color,
    required this.message,
    required this.closeHandler,
  }) : super(key: key);

  /// [color] sets the background color.
  final Color? color;

  /// [message] to be displayed in the notification.
  final String message;

  /// [closeHandler] closes the notification modal.
  final void Function() closeHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.yellow,
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(0),
              child: Text(
                message,
                softWrap: true,
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
          ),
          Tooltip(
            message: 'Close',
            child: RoundButton(
              onTapDown: closeHandler,
              onTapUp: () {},
              size: 24,
              icon: Icons.close,
              iconColor: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
