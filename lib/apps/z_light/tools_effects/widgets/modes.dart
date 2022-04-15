import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/audio_visualization.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/wave.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/tools/color_production.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/tools/moods.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/tools/shortcut_colors.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:hpx/widgets/theme.dart';

class ToolModes extends StatefulWidget {
  @override
  State<ToolModes> createState() => _ToolModesState();
}

List<PickerModel> moodList = [
  PickerModel(
    title: 'Tools',
    enabled: false,
  ),
  PickerModel(
      title: 'Shortcut Colors',
      enabled: true,
      value: 'shortcut',
      icon: Icons.shortcut),
  PickerModel(title: 'Mood', enabled: true, value: 'mood', icon: Icons.mood),
  PickerModel(
      title: 'Colors Production',
      enabled: true,
      value: 'colorsproduction',
      icon: Icons.production_quantity_limits),
  PickerModel(
    title: 'Effects',
    enabled: false,
  ),
  PickerModel(title: 'Wave', enabled: true, value: 'wave', icon: Icons.waves),
  PickerModel(
      title: 'Audio Visualizer',
      enabled: true,
      value: 'audiovisualizer',
      icon: Icons.audiotrack)
];

class _ToolModesState extends State<ToolModes> {
  Widget? preset = AudioVisualPreset();

  changeComponent() {
    switch (pickerChoice?.value) {
      case "shortcut":
        return ShortcutColorsPreset();
      case "mood":
        return MoodPreset();
      case "colorsproduction":
        return ColorProductionPreset();
      case "audiovisualizer":
        return AudioVisualPreset();
      case "wave":
        return WavePreset();
      default:
        return AudioVisualPreset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 5.0, top: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Tools & Effects", textAlign: TextAlign.left, style: h4Style),
            SizedBox(
                // width: MediaQuery.of(context).size.width * 0.3,
                child: PickerDropdown(
                    onChange: (PickerModel? returnValue) {
                      setState(() {
                        preset = changeComponent();
                      });
                    },
                    pickerList: moodList)),
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: preset,
            ),
          ],
        ));
  }
}
