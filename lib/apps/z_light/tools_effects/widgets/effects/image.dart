import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hpx/providers/tools_effect_provider/widget/image_mode_provder.dart';
import 'package:hpx/utils/constants.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class ImagePreset extends StatefulWidget {
  const ImagePreset({Key? key}) : super(key: key);

  @override
  State<ImagePreset> createState() => _ImagePresetState();
}

class _ImagePresetState extends State<ImagePreset> {
  dynamic filePath;

  //// this function sets the default effect degree value to the degree knob
  @override
  void initState() {
    processDefault();
    super.initState();
  }

  void processDefault() {
    ImageModeProvider imageModeProvider =
        Provider.of<ImageModeProvider>(context, listen: false);
    setState(() {
      filePath = Image.memory(imageModeProvider.imageBytes).image;
    });
  }

  void _showPhotoLibrary() async {
    ImageModeProvider imageModeProvider =
        Provider.of<ImageModeProvider>(context, listen: false);

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'ico'],
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      imageModeProvider.imageBytes = File(file.path!).readAsBytesSync();
      imageModeProvider.extractColors();
      await imageModeProvider.setImageToExtractedEffect(context);
      setState(() {
        filePath = Image.memory(imageModeProvider.imageBytes).image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ImageModeProvider imageModeProvider =
        Provider.of<ImageModeProvider>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 170,
                width: MediaQuery.of(context).size.width * 0.14,
                decoration: BoxDecoration(
                  image: DecorationImage(image: filePath, fit: BoxFit.cover),
                ),
              ),
              Container(margin: const EdgeInsets.only(top: 5.0)),
              InkWell(
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  _showPhotoLibrary();
                },
                child: Text("Browse",
                    style: labelStyle, textAlign: TextAlign.right),
              )
            ],
          ),
        ],
      ),
    );
  }
}
