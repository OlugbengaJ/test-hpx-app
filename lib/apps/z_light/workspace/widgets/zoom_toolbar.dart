import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hpx/widgets/components/round_button.dart';
import 'package:ionicons/ionicons.dart';

class ZoomToolbar extends StatelessWidget {
  ZoomToolbar({Key? key, required this.zoomIndex, required this.onChange})
      : super(key: key);

  final Function(double zoomValue) onChange;
  final double _buttonSize = 24;
  double zoomIndex;

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
        width: 340,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundButton(
              iconData: Icons.add,
              size: _buttonSize,
              onPressed: () {
                zoomIndex += 0.01;
                onChange(zoomIndex);
              },
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 48, maxHeight: 24),
              child: TextField(
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
              iconData: Icons.remove,
              size: _buttonSize,
              onPressed: () {
                zoomIndex -= 0.01;
                onChange(zoomIndex);
              },
            ),
            Container(margin: const EdgeInsets.only(right: 20.0)),
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white, backgroundColor: Colors.transparent),
              child: const Icon(
                Ionicons.scan_outline,
                size: 30.0,
                color: Colors.grey,
              ),
              onPressed: null,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white, backgroundColor: Colors.transparent),
              child: const Icon(
                Ionicons.expand_outline,
                size: 30.0,
                color: Colors.grey,
              ),
              onPressed: null,
            )
          ],
        ),
      ),
    );
  }
}
