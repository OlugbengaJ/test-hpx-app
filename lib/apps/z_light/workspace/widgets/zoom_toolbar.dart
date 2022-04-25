import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hpx/apps/z_light/workspace/widgets/round_button.dart';

class ZoomToolbar extends StatelessWidget {
  const ZoomToolbar({
    Key? key,
    required this.zoomTextController,
    required this.zoomInHandler,
    required this.zoomOutHandler,
  }) : super(key: key);

  final TextEditingController zoomTextController;
  final VoidCallback zoomInHandler;
  final VoidCallback zoomOutHandler;
  final double buttonSize = 24;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // TODO: refactor to use themes
        color: Color.fromARGB(255, 54, 53, 53),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      child: SizedBox(
        width: 160,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundButton(
              iconData: Icons.add_circle_rounded,
              size: buttonSize,
              onPressed: zoomInHandler,
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 48, maxHeight: 24),
              child: TextField(
                controller: zoomTextController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                      borderSide: BorderSide.none),
                  fillColor: Colors.black,
                  filled: true,
                  contentPadding: EdgeInsets.all(0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            RoundButton(
              iconData: Icons.remove_circle_rounded,
              size: buttonSize,
              onPressed: zoomOutHandler,
            ),
          ],
        ),
      ),
    );
  }
}
