import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  /// [DropDown] is convenient widget that returns a [DropdownButton].
  ///
  /// Intended to centralize behavior of and all dropdown buttons in the app.
  const DropDown({
    Key? key,
    this.enabled = true,
    this.height = 30.0,
    required this.hint,
    this.hintStyle,
    this.initialValue,
    this.isExpanded = false,
    required this.items,
    this.menuMaxHeight = 400.0,
    required this.onChangedHandler,
  }) : super(key: key);

  /// [height] of the dropdown button.
  final double? height;

  /// [hint] is a placeholder String that is displayed
  /// when dropdown is disabled or has no value.
  final String hint;

  /// [hintStyle] is style to use for the [hint].
  final TextStyle? hintStyle;

  final bool isExpanded;

  /// [items] children of the dropdown button that user can select.
  final List<DropdownMenuItem<Object>>? items;

  /// [onChangedHandler] callback function for the dropdown.
  final void Function(Object?)? onChangedHandler;

  /// [enabled] disables the dropdown selection if false.
  final bool enabled;

  /// [initialValue] is the default value for the dropdown menu.
  final Object? initialValue;

  final double? menuMaxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColorLight,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: DropdownButton(
          value: initialValue,
          menuMaxHeight: menuMaxHeight,
          hint: Text(hint, style: hintStyle),
          underline: const SizedBox(),
          items: items,
          isExpanded: isExpanded,
          onChanged: enabled ? onChangedHandler : null,
        ),
      ),
    );
  }
}