import 'package:flutter/material.dart';
import 'package:hpx/widgets/theme.dart';


void browse(){

}

Future<void> profileListDialog(BuildContext context) async {
  final List<String> entries = <String>[
    'A', 'B',
    'A', 'B',
    'A', 'B',
    'A', 'B',
    'A', 'B',
  ];
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 600,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: const Text("Select an application"),
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
                      width: 600,
                      margin: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: TextButton(
                              onPressed: () => browse(),
                              style: textBtnStyleWhite,
                              child: const SizedBox(
                                height: 40,
                                width: 100,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Browse',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          InkWell(
                            child: Container(
                              height: 40,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 450,
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            child: Image.asset(
                              "assets/images/zlight_icon.png",
                              height: 40,
                            ),
                          ),
                          Container(
                            child: const Text(
                              "Upload a picture",
                              style: TextStyle(
                                decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            height: 40,
                            width: 200,
                            child: const Center(child: Text("Default")),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16),
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
                    )
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 600,
                      margin: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [                          
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Cancel"),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 20,
                          ),

                          Container(
                            child: TextButton(
                              onPressed: () => browse(),
                              style: textBtnStyleWhite,
                              child: const SizedBox(
                                height: 40,
                                width: 100,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Add',
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