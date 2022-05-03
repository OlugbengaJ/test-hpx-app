import 'package:flutter/material.dart';
import 'package:hpx/widgets/theme.dart';

class ImagePreset extends StatefulWidget {
  const ImagePreset({Key? key}) : super(key: key);

  @override
  State<ImagePreset> createState() => _ImagePresetState();
}

class _ImagePresetState extends State<ImagePreset> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    height: 170,
                    width: MediaQuery.of(context).size.width * 0.155,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/backdrop.png"),
                          fit: BoxFit.cover),
                    )),
                Container(margin: const EdgeInsets.only(top: 5.0)),
                Text("Browse", style: labelStyle, textAlign: TextAlign.right)
              ],
            ),
          ],
        ));
  }
}
