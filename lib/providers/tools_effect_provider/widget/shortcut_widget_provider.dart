import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/widgets/theme.dart';

// Mode provider to manage the current colors or effects of a mode been selected
class ShortcutWidgetProvider extends ChangeNotifier {
  /// variable containing all generated shorcut commands widgets
  List<Widget> commandsList = [];
  List<List<String>> keys = [];
  LayersProvider? layerProvider;
  LayerItemModel? sublayerInfo;

  /// variable for managing keys input been set to the for the input field
  List<TextEditingController> keyController = [];

  /// variable for managing label input been set to the for the label field
  List<TextEditingController> labelController = [];

  getSubLayerInfo() {
    return layerProvider?.getCurrentSublayer();
  }

  /// function to generate the shortcut widget with the text controller and input field
  /// also sets the default input field if passed as an argument in the function or defaults to 'esc'
  addNewCommand(String textinput) {
    TextEditingController inputController = TextEditingController();
    inputController.text = (textinput != '') ? textinput : " ";
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
                Text('Enter Text',
                    textAlign: TextAlign.left, style: labelStyle),
                // SizedBox(
                //     width: 100,
                //     height: 25,
                //     child: TextField(
                //         controller: labelController.last,
                //         obscureText: false,
                //         decoration: const InputDecoration(
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.all(Radius.zero)),
                //           contentPadding:
                //               EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                //           hintStyle: TextStyle(color: Colors.white),
                //         ),
                //         style: const TextStyle(fontSize: 14)))
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 150,
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
                        style: const TextStyle(fontSize: 12)))
              ],
            ))
          ])
        ]));
  }
}
