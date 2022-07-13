import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hpx/providers/profile_provider/profile_provider.dart';
import 'package:hpx/utils/constants.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

void browse(BuildContext context) async {
  ProfileProvider profileProvider =
      Provider.of<ProfileProvider>(context, listen: false);
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  String parentDir = "";
  if (result != null) {
    if (!kIsWeb) {
      if (Platform.isWindows) {
        File file = File(result.files.single.path!);
        parentDir = file.parent.toString().split("\\").toList().last;
      } else if (Platform.isLinux) {
        File file = File(result.files.single.path!);
      }

      if (parentDir.endsWith("'")) {
        parentDir = parentDir.substring(0, parentDir.length - 1);
      }
      profileProvider.setProfileName(parentDir);
    } else {}
  } else {
    // User canceled the picker
  }
}

void addProfile(BuildContext context) {
  ProfileProvider profileProvider =
      Provider.of<ProfileProvider>(context, listen: false);
  profileProvider.addProfile();
}

Future<void> profileListDialog(BuildContext context) async {
  final List<String> entries = <String>[
    'A',
    'B',
    'A',
    'B',
    'A',
    'B',
    'A',
    'B',
    'A',
    'B',
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
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
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
                      margin: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 111,
                            height: 28,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => browse(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Browse",
                                      style:
                                          TextStyle(color: Color(0xFF212121)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                                    padding: EdgeInsets.all(4),
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
                              Constants.zlightIcon,
                              height: 40,
                            ),
                          ),
                          Container(
                            child: const Text(
                              "Upload a picture",
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            height: 40,
                            width: 200,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Consumer<ProfileProvider>(
                                    builder: (_, provider, __) {
                                  return Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(provider.getProfileName()),
                                  );
                                }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16),
                      width: 600,
                      height: 450,
                      color: const Color(0xFF212121),
                      child:
                          Consumer<ProfileProvider>(builder: (_, provider, __) {
                        return Column(
                          children: [
                            Container(
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
                            ),
                            Expanded(
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(2),
                                  itemCount: provider.profiles.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                      ),
                                      height: 70,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            Constants.zImage,
                                            height: 40,
                                          ),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Text(
                                                provider.profiles[index].name),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        );
                      }),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 600,
                      margin: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(4)),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Cancel"),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () => addProfile(context),
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
