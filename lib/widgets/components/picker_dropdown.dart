import 'package:flutter/material.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class PickerModel {
  final String title;
  final String? value;
  final bool enabled;
  final IconData? icon;
  PickerModel(
      {required this.title, this.value, required this.enabled, this.icon});

  @override
  bool operator ==(Object other) =>
      other is PickerModel && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

class PickerDropdown extends StatefulWidget {
  const PickerDropdown(
      {Key? key,
      required this.pickerList,
      this.defaultPicker,
      this.pickerHintText = "Choose an option ..",
      required this.onChange})
      : super(key: key);

  final PickerModel? defaultPicker;
  final String? pickerHintText;
  final List<PickerModel> pickerList;
  final Function(PickerModel? pickerModel) onChange;

  @override
  State<PickerDropdown> createState() => _PickerDropdownState();
}

class _PickerDropdownState extends State<PickerDropdown> {
  PickerModel? currentPickerValue;

  @override
  void initState() {
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    super.initState();
    setState(() {
      currentPickerValue = widget.defaultPicker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.10,
      child: Container(
        // padding: const EdgeInsets.only(left: 10),
        height: 35,
        margin: const EdgeInsets.only(top: 10, bottom: 0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.shade700,
          ),
        ),
        child: DropdownButton<PickerModel>(
          menuMaxHeight: 400,
          focusColor: Colors.transparent,
          value: currentPickerValue,
          dropdownColor: Colors.grey.shade900,
          hint: SizedBox(
            child: Row(
              children: [
                Text(widget.pickerHintText!),
              ],
            ),
          ),
          icon: const Icon(
            Icons.arrow_drop_down_outlined,
            size: 20,
          ),
          elevation: 2,
          alignment: AlignmentDirectional.bottomStart,
          onChanged: (PickerModel? newValue) {
            // print(modeProvider.currentMode?.value);
            setState(() {
              currentPickerValue = newValue;
              widget.onChange(newValue);
            });
          },
          items: widget.pickerList
              .map<DropdownMenuItem<PickerModel>>((PickerModel value) {
            return DropdownMenuItem<PickerModel>(
              enabled: value.enabled,
              value: value,
              child: Container(
                padding: EdgeInsets.only(
                    left: value.enabled == true ? 20 : 0, top: 0, bottom: 0),
                child: Row(
                  children: [
                    value.enabled == false || value.icon == null
                        ? Container()
                        : Icon(value.icon, size: 16),
                    value.enabled == false || value.icon == null
                        ? Container()
                        : const SizedBox(
                            width: 20,
                          ),
                    Text(
                      value.title,
                      style: value.enabled == true ? TextStyle() : labelStyle,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          underline: const SizedBox(
            height: 30,
            width: 2,
          ),
        ),
      ),
    );
  }
}
