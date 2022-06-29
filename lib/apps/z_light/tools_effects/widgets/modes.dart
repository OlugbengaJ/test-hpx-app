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
    await Future.delayed(const Duration(seconds: 0));
    setState(() {
      modeProvider.changeModeComponent(modeProvider.modePicker, context, false,
          changeComp: true);
    });
  }

  changeMode(PickerModel value) {
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    // /// initialize the layers provider to use to send notification accross the layers
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    setState(() {
      modeProvider.changeModeComponent(value, context, false, changeComp: true);
    });
  }

  shortcutAlertDialogOnChangeMode(PickerModel value) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SimpleDialog(
              contentPadding: const EdgeInsets.only(
                  top: 40, left: 20, right: 20, bottom: 30),
              children: [
                Text(
                  'Leaving Shortcut Tools & Effect',
                  style: h2Style,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  width: 400,
                  child: Text(
                    'Switching to another layer or effect would permanently delete/overide your shortcut color configurations?',
                    style: labelStyle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                        ),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          changeMode(value);
                          Navigator.of(context).pop();
                        },
                        style: textBtnStyleWhite,
                        child: const Text("Continue"),
                      ),
                    ],
                  ),
                ),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    ModeProvider modeProvider = Provider.of<ModeProvider>(context);
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
                    if (modeProvider.currentMode.value == EnumModes.shortcut &&
                        returnValue?.value != EnumModes.shortcut) {
                      shortcutAlertDialogOnChangeMode(returnValue!);
                    } else {
                      setState(() {
                        modeProvider.changeModeComponent(
                            returnValue, context, false,
                            changeComp: true);
                      });
                    }
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
