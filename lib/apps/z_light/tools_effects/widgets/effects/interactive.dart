import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:hpx/widgets/theme.dart';

class InteractivePreset extends StatefulWidget {
  const InteractivePreset({Key? key}) : super(key: key);

  @override
  State<InteractivePreset> createState() => _InteractivePresetState();
}

class _InteractivePresetState extends State<InteractivePreset> {
  final _toolsProvider = ColorPickerProvider();
  double _speedSliderValue = 50.0;
  double _sizeSliderValue = 6.0;
  TextEditingController degreeController = TextEditingController();
  final _modeProvider = ModeProvider();
  final PickerModel _defaultPicker = PickerModel(
      title: 'Key Wave', enabled: true, value: InteractiveEnum.keywave);

  void _setSliderValue(double returnValue, String type) {
    setState(() {
      if (type == 'speed') {
        _speedSliderValue = returnValue;
      }
      if (type == 'size') {
        _sizeSliderValue = returnValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: PickerDropdown(
                    onChange: (PickerModel? returnValue) {
                      setState(() {
                        // preset = changeComponent();
                      });
                    },
                    defaultPicker: _defaultPicker,
                    pickerList:
                        _modeProvider.getPickerModes('interactivesub'))),
            Container(margin: const EdgeInsets.only(bottom: 30.0)),
            Divider(
              color: Colors.grey.shade800,
              height: 1,
            ),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Wrap(
              children: _toolsProvider
                  .generateColorPickerWidget(interactiveColorList),
            ),
            Container(margin: const EdgeInsets.only(bottom: 50.0)),
            Divider(
              color: Colors.grey.shade800,
              height: 1,
            ),
            Container(margin: const EdgeInsets.only(bottom: 20.0)),
            Text("Speed", textAlign: TextAlign.left, style: labelStyle),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Slider(
              value: _speedSliderValue,
              max: 100,
              min: 0,
              divisions: 100,
              label: _speedSliderValue.round().toString(),
              onChanged: (double value) {
                _setSliderValue(value, "speed");
              },
            ),
            Row(children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("0%", textAlign: TextAlign.left, style: pStyle),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("100%", textAlign: TextAlign.right, style: pStyle),
                ],
              ))
            ]),
            Container(margin: const EdgeInsets.only(bottom: 30.0)),
            Text("Size", textAlign: TextAlign.left, style: labelStyle),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Slider(
              value: _sizeSliderValue,
              max: 24,
              min: 0,
              divisions: 24,
              label: _sizeSliderValue.round().toString(),
              onChanged: (double value) {
                _setSliderValue(value, "size");
              },
            ),
            Row(children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("small", textAlign: TextAlign.left, style: pStyle),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("large", textAlign: TextAlign.right, style: pStyle),
                ],
              ))
            ]),
          ],
        ));
  }
}
