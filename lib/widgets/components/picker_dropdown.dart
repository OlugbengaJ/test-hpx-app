import 'package:flutter/material.dart';

class PickerModel {
  final String title;
  final String? value;
  final bool enabled;
  final IconData? icon;
  PickerModel(
      {required this.title, this.value, required this.enabled, this.icon});
}

PickerModel? pickerChoice;

class PickerDropdown extends StatefulWidget {
  const PickerDropdown(
      {Key? key, required this.pickerList, required this.onChange})
      : super(key: key);

  final List<PickerModel> pickerList;
  final Function(PickerModel? pickerModel) onChange;

  @override
  State<PickerDropdown> createState() => _PickerDropdownState();
}

class _PickerDropdownState extends State<PickerDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 40,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          border: Border.all(
        width: 1,
        color: Colors.grey,
      )),
      child: DropdownButton<PickerModel>(
        dropdownColor: Colors.grey.shade900,
        hint: Row(
          children: const [Text('Choose ...')],
        ),
        value: pickerChoice,
        icon: const Icon(
          Icons.arrow_drop_down_outlined,
          size: 20,
        ),
        elevation: 2,
        underline: const SizedBox(
          height: 30,
          width: 2,
        ),
        onChanged: (PickerModel? newValue) {
          setState(() {
            pickerChoice = newValue!;
            widget.onChange(newValue);
          });
        },
        items: widget.pickerList
            .map<DropdownMenuItem<PickerModel>>((PickerModel value) {
          return DropdownMenuItem<PickerModel>(
            enabled: value.enabled,
            value: value,
            child: Container(
              margin: const EdgeInsets.only(left: 0),
              padding: EdgeInsets.only(
                  left: value.enabled ? 30 : 0, top: 0, bottom: 0),
              child: Row(
                children: [
                  Icon(value.icon, size: 16),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(value.title),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
