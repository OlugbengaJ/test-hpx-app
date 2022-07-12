import 'package:flutter/material.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:toggle_switch/toggle_switch.dart';


void browse(BuildContext context){
  Navigator.pop(context);
}

Future<void> viewAllProfileDialog(BuildContext context) async {
  final List<String> entries = <String>[
    'A',
  ];
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          //height: 700,
          width: 900,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: const Text("Auto profile switching"),
                          ),

                          ToggleSwitch(
                            minWidth: 90.0,
                            cornerRadius: 8.0,
                            activeBgColors: const [[Colors.white], [Colors.white]],
                            activeFgColor: Colors.black,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.black,
                            initialLabelIndex: 0,
                            totalSwitches: 2,
                            labels: const ['OFF', 'ON'],
                            radiusStyle: true,
                            onToggle: (index) {
                              print('switched to: $index');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text("My Profiles"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 800,
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: TextButton(
                                    onPressed: () => browse(context),
                                    style: textBtnStyleWhite,
                                    child: const SizedBox(
                                      width: 100,
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'New Profile',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  child: TextButton(
                                    onPressed: () => browse(context),
                                    style: textBtnStyleWhite,
                                    child: const SizedBox(
                                      width: 100,
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Import',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          InkWell(
                            child: Container(
                              width: 150,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 1),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("A - Z"),
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [              
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        width: 600,
                        height: 450,
                        color: Colors.black,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(2),
                          itemCount: entries.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 1),
                              ),
                              height: 70,
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/zlight_icon.jpg",
                                    height: 40,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: const Text("Default"),
                                  ),
                                ],
                              ),
                            );
                          }
                        ),
                      ),
                    )
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 600,
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              style: textBtnStyleWhite,
                              child: const SizedBox(
                                height: 40,
                                width: 100,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Done',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      );
    },
  );
}