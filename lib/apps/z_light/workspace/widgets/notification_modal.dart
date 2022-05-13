import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/round_button.dart';

class ModalNotification extends StatelessWidget {
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Tooltip(
              message: 'Close',
              child: Align(
                alignment: Alignment.centerRight,
                child: RoundButton(
                  onTapDown: closeHandler,
                  onTapUp: () {},
                  size: 24,
                  icon: Icons.close,
                  iconColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
        ...children,
      ],
    );
  }
}
