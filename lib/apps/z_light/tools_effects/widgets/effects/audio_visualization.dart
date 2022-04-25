import 'package:flutter/material.dart';
import 'package:hpx/widgets/components/color_picker.dart';
import 'package:hpx/widgets/theme.dart';

class AudioVisualPreset extends StatefulWidget {
  @override
  State<AudioVisualPreset> createState() => _AudioVisualPresetState();
}

class _AudioVisualPresetState extends State<AudioVisualPreset> {
  String activatedButton = "Solid";

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(margin: const EdgeInsets.only(top: 20.0)),
            const Divider(
              color: Colors.white,
              height: 1,
            ),
            Container(margin: const EdgeInsets.only(top: 20.0)),
            Text("Color Presets", textAlign: TextAlign.left, style: h4Style),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FlatButton(
                            textColor: (activatedButton == 'Gradient')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (activatedButton == 'Gradient')
                                ? Colors.black
                                : Colors.white,
                            child: const Text('Solid'),
                            onPressed: () {
                              setState(() {
                                activatedButton = "Solid";
                              });
                            },
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FlatButton(
                            textColor: (activatedButton != 'Gradient')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (activatedButton != 'Gradient')
                                ? Colors.black
                                : Colors.white,
                            child: Text('Gradient'),
                            onPressed: () {
                              setState(() {
                                activatedButton = "Gradient";
                              });
                            },
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: (activatedButton == 'Gradient')
                  ? Column(
                      children: [
                        Color_Picker(
                            leftTitle: 'Edit',
                            title: '',
                            picker: true,
                            color: Colors.greenAccent)
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                          Text("Primary Color",
                              textAlign: TextAlign.left, style: h5Style),
                          Color_Picker(
                              leftTitle: '',
                              title: '',
                              width: 30.0,
                              height: 30.0,
                              picker: true,
                              color: Colors.red),
                          Text("Secondary Color",
                              textAlign: TextAlign.left, style: h5Style),
                          Color_Picker(
                              leftTitle: '',
                              title: '',
                              width: 30.0,
                              height: 30.0,
                              picker: true,
                              color: Colors.orange),
                          Text("Background Color",
                              textAlign: TextAlign.left, style: h5Style),
                          Color_Picker(
                              leftTitle: '',
                              title: '',
                              width: 30.0,
                              height: 30.0,
                              picker: true,
                              color: Colors.transparent),
                        ]),
            ),
          ],
        ));
  }
}
