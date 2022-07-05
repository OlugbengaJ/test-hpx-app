import 'package:flutter/material.dart';
import 'package:hpx/widgets/theme.dart';

// Mode provider to manage the current colors or effects of a mode been selected
class ShortcutWidgetProvider extends ChangeNotifier {
  /// variable containing all generated shorcut commands widgets
  List<Widget> commandsList = [];
  List<List<String>> keys = [];

  /// variable for managing keys input been set to the for the input field
  List<TextEditingController> keyController = [];

  /// function to generate the shortcut widget with the text controller and input field
  /// also sets the default input field if passed as an argument in the function or defaults to 'esc'
  addNewCommand(String textinput) {
    TextEditingController inputController = TextEditingController();
    inputController.text = "Enter Text ";
    keyController.add(inputController);

    return Container(
        decoration: BoxDecoration(color: Colors.grey.shade800),
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
        margin: const EdgeInsets.only(top: 5, left: 0, right: 10),
        child: Column(children: [
          Row(children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 150,
                    height: 25,
                    child: TextField(
                        onSubmitted: (String? value) {
                          keyController.last.text = value.toString();
                        },
                        controller: keyController.last,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 22),
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: labelStyle))
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 150,
                    height: 25,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Text(textinput,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
              ],
            ))
          ])
        ]));
  }
}
