import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/providers/tools_effect_provider/widget/image_mode_provder.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class ImagePreset extends StatefulWidget {
  // ImagePreset({Key? key}) : super(key: key);

  @override
  State<ImagePreset> createState() => _ImagePresetState();
}

class _ImagePresetState extends State<ImagePreset> {
  dynamic filePath;

  //// this function sets the default effect degree value to the degree knob
  @override
  void initState() {
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    setState(() {
      filePath =
          Image.memory(modeProvider.currentMode.effects.imageBytes!).image;
    });
    super.initState();
  }

  void _showPhotoLibrary() async {
    ImageModeProvider imageModeProvider =
        Provider.of<ImageModeProvider>(context, listen: false);
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'ico'],
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      imageModeProvider.setImageBytes(File(file.path!).readAsBytesSync());
      imageModeProvider.extractColors();
      imageModeProvider.setImageToExtractedEffect(context);
      setState(() {
        filePath =
            Image.memory(modeProvider.currentMode.effects.imageBytes!).image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 170,
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.memory(
                              modeProvider.currentMode.effects.imageBytes!)
                          .image,
                      fit: BoxFit.fill),
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
