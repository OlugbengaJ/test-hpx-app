import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
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
  dynamic filePath = const AssetImage(Constants.defaultImageMode);

  //// this function sets the default effect degree value to the degree knob
  @override
  void initState() {
    processDefault();
    super.initState();
  }

  Future<void> processDefault() async {
    ImageModeProvider imageModeProvider =
        Provider.of<ImageModeProvider>(context, listen: false);
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);

    /// convert the default image into color paltte
    ByteData image = await rootBundle.load(Constants.defaultImageMode);
    await imageModeProvider.extractColors(image.buffer.asUint8List());
    modeProvider.setCurrentMode(ToolsModeModel(
        currentColor: imageModeProvider.extractedColors,
        effects: modeProvider.currentMode.effects,
        name: modeProvider.currentMode.name));
    layerProvider.toolsEffectsUpdated();
  }

  void _showPhotoLibrary() async {
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
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
      await imageModeProvider.extractColors(File(file.path!).readAsBytesSync());
      modeProvider.setCurrentMode(ToolsModeModel(
          currentColor: imageModeProvider.extractedColors,
          effects: modeProvider.currentMode.effects,
          name: modeProvider.currentMode.name));
      setState(() {
        filePath = Image.memory(File(file.path!).readAsBytesSync()).image;
      });
    }
    layerProvider.toolsEffectsUpdated();
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
