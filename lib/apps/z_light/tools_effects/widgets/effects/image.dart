import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hpx/widgets/theme.dart';

class ImagePreset extends StatefulWidget {
  const ImagePreset({Key? key}) : super(key: key);

  @override
  State<ImagePreset> createState() => _ImagePresetState();
}

class _ImagePresetState extends State<ImagePreset> {
  String? filePath = "assets/images/backdrop.png";

  void _showPhotoLibrary() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'ico'],
    );
    if (result != null) {
      PlatformFile file = result.files.first;

      final bytes = File(file.path!).readAsBytesSync();
      setState(() {
        // filePath = "data:image/png;base64," + base64Encode(bytes);
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    height: 170,
                    width: MediaQuery.of(context).size.width * 0.125,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(filePath!), fit: BoxFit.cover),
                    )),
                Container(margin: const EdgeInsets.only(top: 5.0)),
                InkWell(
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      _showPhotoLibrary();
                    },
                    child: Text("Browse",
                        style: labelStyle, textAlign: TextAlign.right))
              ],
            ),
          ],
        ));
  }
}
