import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hpx/apps/z_light/workspace/widgets/round_button.dart';

class ZoomToolbar extends StatelessWidget {
  const ZoomToolbar({Key? key}) : super(key: key);

  final double _buttonSize = 24;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundButton(
          iconData: Icons.add_circle_rounded,
          size: _buttonSize,
          onPressed: null,
        ),
        Container(
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide.none
              ),
              fillColor: Colors.black,
              filled: true,
              contentPadding: EdgeInsets.all(0),
            ),
            textAlign: TextAlign.center,
          ),
          constraints: const BoxConstraints(maxWidth: 48, maxHeight: 24),
        ),
        RoundButton(
          iconData: Icons.remove_circle_rounded,
          size: _buttonSize,
          onPressed: null,
        ),
      ],
    );
  }
}
