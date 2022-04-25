import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hpx/apps/z_light/workspace/widgets/round_button.dart';

class ZoomToolbar extends StatelessWidget {
  const ZoomToolbar({
    Key? key,
    required this.zoomTextController,
    required this.zoomInHandler,
    required this.zoomExpandHandler,
    required this.zoomOutHandler,
    required this.zoomCollapseHandler,
    required this.zoomEndHandler,
  }) : super(key: key);

  final TextEditingController zoomTextController;
  final VoidCallback zoomInHandler;
  final VoidCallback zoomExpandHandler;
  final VoidCallback zoomOutHandler;
  final VoidCallback zoomCollapseHandler;
  final VoidCallback zoomEndHandler;

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
        width: 200,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Tooltip(
                message: 'Zoom In',
                triggerMode: TooltipTriggerMode.tap,
                child: RoundButton(
                  iconData: Icons.add_circle_rounded,
                  size: buttonSize,
                  onTapDown: zoomInHandler,
                  onTapUp: zoomEndHandler,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
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
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Tooltip(
                message: 'Zoom Out',
                triggerMode: TooltipTriggerMode.tap,
                child: RoundButton(
                  iconData: Icons.remove_circle_rounded,
                  size: buttonSize,
                  onTapDown: zoomOutHandler,
                  onTapUp: zoomEndHandler,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Tooltip(
                message: 'Collapse',
                triggerMode: TooltipTriggerMode.tap,
                child: RoundButton(
                  iconData: Icons.center_focus_strong_sharp,
                  size: buttonSize,
                  onTapDown: zoomCollapseHandler,
                  onTapUp: zoomEndHandler,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Tooltip(
                message: 'Expand',
                triggerMode: TooltipTriggerMode.tap,
                child: RoundButton(
                  iconData: Icons.fullscreen_sharp,
                  size: buttonSize + 6, // adjust the icon size to match
                  onTapDown: zoomExpandHandler,
                  onTapUp: zoomEndHandler,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
