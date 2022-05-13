import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/round_button.dart';

class StripNotification extends StatelessWidget {
  const StripNotification({
    Key? key,
    required this.message,
    required this.closeHandler,
  }) : super(key: key);

  final String message;
  final void Function() closeHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(0),
            child: Text(
              message,
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
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
