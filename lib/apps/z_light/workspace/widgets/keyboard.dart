import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/key_path_clipper.dart';
import 'package:hpx/apps/z_light/workspace/widgets/key_path.dart';

class KeyboardEn extends StatelessWidget {
  const KeyboardEn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(

    // );
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Material(
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, 9),
            child: SizedBox(
              width: width,
              height: height * 0.99,
              child: GestureDetector(
                onTap: () => debugPrint('\r\ngesture triggered'),
                child: KeyPath(
                  clipper: const KeyPathClipper(zoomScale: 0.5),
                  child: Container(
                    margin: EdgeInsets.zero,
                    child: const Text('Q'),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                'Keys',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
