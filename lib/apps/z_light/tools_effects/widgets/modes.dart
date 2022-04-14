import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hpx/widgets/components/color_picker.dart';
import 'package:hpx/widgets/theme.dart';

class toolModes extends StatefulWidget {
  @override
  State<toolModes> createState() => _toolModesState();
}

class _toolModesState extends State<toolModes> {
  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  String dropdownvalue = 'Item 1';

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Tools & Effects", textAlign: TextAlign.left, style: h4Style),
            Container(
                width: MediaQuery.of(context).size.width * 0.3,
                margin: EdgeInsets.only(top: 0, left: 0, right: 30),
                padding: EdgeInsets.zero,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                  isExpanded: true,
                  value: dropdownvalue,
                  hint: new Text("Select City"),
                  icon: null,
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ))),
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Color_Picker(
                    //     title: 'Neutral (D65 White Point)',
                    //     color: Colors.orangeAccent),
                  ]),
            ),
          ],
        ));
  }
}
