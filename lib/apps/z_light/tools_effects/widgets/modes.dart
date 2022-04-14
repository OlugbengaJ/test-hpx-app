import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/presets/audio_visualization.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/presets/moods.dart';
import 'package:hpx/widgets/components/color_picker.dart';
import 'package:hpx/widgets/theme.dart';

class toolModes extends StatefulWidget {
  @override
  State<toolModes> createState() => _toolModesState();
}

class _toolModesState extends State<toolModes> {
  // List of items in our dropdown menu
  var items = [
    'Mood',
    'Audio Visualization',
  ];

  String dropdownvalue = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Tools & Effects", textAlign: TextAlign.left, style: h4Style),
            Container(
                width: MediaQuery.of(context).size.width * 0.3,
                margin: EdgeInsets.only(top: 0, left: 0, right: 30),
                padding: EdgeInsets.zero,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                  isExpanded: true,
                  value: dropdownvalue,
                  hint: new Text("Select City"),
                  icon: null,
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ))),
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [MoodPreset(), AudioVisualPreset()]),
            ),
          ],
        ));
  }
}
