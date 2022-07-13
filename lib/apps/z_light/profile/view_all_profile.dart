import 'package:flutter/material.dart';
import 'package:hpx/utils/constants.dart';
import 'package:toggle_switch/toggle_switch.dart';

void browse(BuildContext context) {
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
              children: <Widget>[
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: 800,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Center(
                                  child: Container(
                                    height: 28,
                                    width: 141,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () => browse(context),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.add,
                                              color: Color(0xFF212121),
                                            ),
                                            Text(
                                              "New Profile",
                                              style: TextStyle(
                                                  color: Color(0xFF212121)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Center(
                                  child: Container(
                                    height: 28,
                                    width: 141,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () => browse(context),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            ImageIcon(
                                              AssetImage(
                                                  "assets/images/icons/import.png"),
                                              color: Color(0xFF212121),
                                            ),
                                            Text(
                                              "Import",
                                              style: TextStyle(
                                                  color: Color(0xFF212121)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        child: const Text(
                                            "Auto profile switching"),
                                      ),
                                      Container(
                                        height: 28,
                                        child: ToggleSwitch(
                                          minWidth: 50,
                                          cornerRadius: 100,
                                          activeBgColors: const [
                                            [Colors.white],
                                            [Colors.white]
                                          ],
                                          activeFgColor: Colors.black,
                                          inactiveBgColor: Colors.grey,
                                          inactiveFgColor: Colors.black,
                                          initialLabelIndex: 0,
                                          totalSwitches: 2,
                                          labels: const ['OFF', 'ON'],
                                          radiusStyle: true,
                                          onToggle: (index) {
                                            debugPrint('switched to: $index');
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              child: Container(
                                height: 28,
                                width: 82,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(2),
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        width: 621,
                        height: 328,
                        color: const Color(0xFF212121),
                        child: ListView.builder(
                            padding: const EdgeInsets.all(2),
                            itemCount: entries.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                                height: 70,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Constants.zImage,
                                      height: 40,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: const Text("Default"),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Container(
                          width: 124,
                          height: 38,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Done",
                                    style: TextStyle(color: Color(0xFF212121)),
                                  ),
                                ],
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
          ),
        ),
      );
    },
  );
}
