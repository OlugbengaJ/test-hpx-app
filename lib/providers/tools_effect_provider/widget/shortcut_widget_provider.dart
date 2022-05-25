import 'package:flutter/material.dart';
import 'package:hpx/widgets/theme.dart';

// Mode provider to manage the current colors or effects of a mode been selected
class ShortcutWidgetProvider extends ChangeNotifier {
  /// variable containing all generated shorcut commands widgets
  List<Widget> commandsList = [];

  /// variable for managing keys input been set to the for the input field
  List<TextEditingController> keyController = [];

  /// function to generate the shortcut widget with the text controller and input field
  /// also sets the default input field if passed as an argument in the function or defaults to 'esc'
  addNewCommand(String textinput) {
    TextEditingController inputController = TextEditingController();
    inputController.text = (textinput != '') ? textinput : "esc";
    keyController.add(inputController);
    commandsList.add(Container(
        decoration: BoxDecoration(color: Colors.grey.shade800),
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
        margin: const EdgeInsets.only(top: 5, left: 0, right: 10),
        child: Row(children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Enter Text', textAlign: TextAlign.left, style: labelStyle),
            ],
          )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 100,
                  height: 25,
                  child: TextField(
                      controller: keyController.last,
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.zero)),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: const TextStyle(fontSize: 14)))
            ],
          ))
        ])));
  }
}
