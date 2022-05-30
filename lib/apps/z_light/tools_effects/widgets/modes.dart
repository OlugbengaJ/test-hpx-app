import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class ToolModes extends StatefulWidget {
  const ToolModes({Key? key}) : super(key: key);

  @override
  State<ToolModes> createState() => _ToolModesState();
}

class _ToolModesState extends State<ToolModes> {
  @override
  void initState() {
    setDefaultMode();
    super.initState();
  }

  ///
  Future setDefaultMode() async {
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    await Future.delayed(Duration(seconds: 0));
    setState(() {
      modeProvider.changeModeComponent(modeProvider.modePicker, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    ModeProvider modeProvider = Provider.of<ModeProvider>(context);
    // /// initialize the layers provider to use to send notification accross the layers
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    return Container(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Tools & Effects", textAlign: TextAlign.left, style: h5Style),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: PickerDropdown(
                  onChange: (PickerModel? returnValue) {
                    setState(() {
                      modeProvider.changeModeComponent(returnValue, context);
                    });
                    layerProvider.toolsEffectsUpdated();
                  },
                  pickerHintText: "Picker a tool or effect mode ....",
                  pickerList: modeProvider.getPickerModes('mood'),
                  defaultPicker: modeProvider.modePicker,
                )),
            Container(
              margin: const EdgeInsets.only(top: 0.0, bottom: 20.0),
              child: modeProvider.preset,
            ),
          ],
        ));
  }
}
