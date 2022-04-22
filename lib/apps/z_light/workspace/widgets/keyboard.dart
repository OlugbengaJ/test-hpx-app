import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/key_rrect.dart';
import 'package:hpx/apps/z_light/workspace/widgets/key_rrect_clipper.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _zoomScale = 1;

    return Stack(
      children: [
        Center(
          child: GestureDetector(
            onTap: () => debugPrint('\r\ngesture triggered'),
            child: const KeyRRect(
              clipper: KeyRRectClipper(zoomScale: _zoomScale),
              zoomScale: _zoomScale,
              // child: Container(),
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.topCenter,
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 100),
        //     child: Text(
        //       'Keys',
        //       style: Theme.of(context).textTheme.headline1,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
