import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hpx/apps/z_light/workspace/widgets/round_button.dart';

class ZoomToolbar extends StatelessWidget {
  const ZoomToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const RoundButton(
          iconData: Icons.add_circle_rounded,
          size: 24,
          onPressed: null,
        ),
        Container(
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          constraints: const BoxConstraints(maxWidth: 48, maxHeight: 24),
        ),
        const RoundButton(
          iconData: Icons.remove_circle_rounded,
          size: 24,
          onPressed: null,
        ),
      ],
    );
  }
}
