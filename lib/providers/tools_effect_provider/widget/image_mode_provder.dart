import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// Mode provider to manage the image colors of a mode been selected
class ImageModeProvider extends ChangeNotifier {
  dynamic currentImage;
  // this function selects an image and return its value in byes
  selectImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'ico'],
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      currentImage = Image.memory(File(file.path!).readAsBytesSync()).image;
      notifyListeners();
    }
  }

  extractColors() {}

  generateColorPalatte() {}
}
