import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class AmbeintPreset extends StatefulWidget {
  const AmbeintPreset({Key? key}) : super(key: key);

  @override
  State<AmbeintPreset> createState() => _AmbeintPresetState();
}

class _AmbeintPresetState extends State<AmbeintPreset> {
  final _modeProvider = ModeProvider();
  double _imageSliderValue = 50.0;
  double _updatesSliderValue = 40.0;
  final PickerModel _defaultScreenPicker = PickerModel(
      title: 'Entire Screen', enabled: true, value: AmbientEnum.entirescreen);
  final PickerModel _defaultDisplayPicker = PickerModel(
      // title: 'Display 1: X:0, Y:0, W:3840, H:2400',
      title: 'Display 1',
      enabled: true,
      value: AmbientDisplayEnum.display1);

  void _setSliderValue(double returnValue, String type) {
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    setState(() {
      if (type == "image") {
        _imageSliderValue = returnValue;
      }
      if (type == "updates") {
        _updatesSliderValue = returnValue;
      }
      layerProvider.toolsEffectsUpdated();
    });
    layerProvider.toolsEffectsUpdated();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20.0),
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
                    defaultPicker: _defaultScreenPicker,
                    pickerList: _modeProvider.getPickerModes('ambientscreen'))),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: PickerDropdown(
                    onChange: (PickerModel? returnValue) {
                      setState(() {
                        // preset = changeComponent();
                      });
                    },
                    defaultPicker: _defaultDisplayPicker,
                    pickerList:
                        _modeProvider.getPickerModes('ambientdisplay'))),
            Container(margin: const EdgeInsets.only(top: 30.0)),
            Divider(
              color: Colors.grey.shade800,
              height: 1,
            ),
            Container(margin: const EdgeInsets.only(bottom: 20.0)),
            Text("Image Quality", textAlign: TextAlign.left, style: labelStyle),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Slider(
              value: _imageSliderValue,
              max: 100,
              min: 0,
              divisions: 10,
              label: _imageSliderValue.round().toString(),
              onChanged: (double value) {
                _setSliderValue(value, "image");
              },
            ),
            Row(children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("LOW", textAlign: TextAlign.left, style: pStyle),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("HIGH", textAlign: TextAlign.right, style: pStyle),
                ],
              ))
            ]),
            Container(margin: const EdgeInsets.only(bottom: 40.0)),
            Text("Updates Per Second",
                textAlign: TextAlign.left, style: labelStyle),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Slider(
              value: _updatesSliderValue,
              max: 100,
              min: 0,
              divisions: 10,
              label: _updatesSliderValue.round().toString(),
              onChanged: (double value) {
                _setSliderValue(value, "updates");
              },
            ),
            Row(children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("LOW", textAlign: TextAlign.left, style: pStyle),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("HIGH", textAlign: TextAlign.right, style: pStyle),
                ],
              ))
            ]),
          ],
        ));
  }
}
