import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as imageLib;

import 'package:file_picker/file_picker.dart';

const String keyPalette = 'palette';
const String keyNoOfItems = 'noIfItems';

int noOfPixelsPerAxis = 6;

// Mode provider to manage the image colors of a mode been selected
class ImageModeProvider extends ChangeNotifier {
  List<Color> extractedColors = [];
  List extractedMatrix = [];
  late Random random;
  Uint8List? imageBytes;
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

  // this function takes an image in bytes and converts it to a matrix of colors
  Future<void> extractColors(Uint8List imageBytes) async {
    extractedColors = await extractPixelsColors(imageBytes);
    extractedMatrix = extractedColors.fold([[]], (list, x) {
      return list.last.length == noOfPixelsPerAxis
          ? (list..add([x]))
          : (list..last.add(x));
    });
  }

  // this function calculate dthe algeberic equivalent of a color into color code
  Color abgrToColor(int argbColor) {
    int r = (argbColor >> 16) & 0xFF;
    int b = argbColor & 0xFF;
    int hex = (argbColor & 0xFF00FF00) | (b << 16) | r;
    return Color(hex);
  }

  // this function converts the bytes data of an image to colors using the alto colr function and each byte chunk of the image
  FutureOr<List<Color>> extractPixelsColors(Uint8List bytes) {
    List<Color> colors = [];

    List<int> values = bytes.buffer.asUint8List();
    imageLib.Image? image = imageLib.decodeImage(values);

    List<int?> pixels = [];

    int? width = image?.width;
    int? height = image?.height;

    int xChunk = width! ~/ (noOfPixelsPerAxis + 1);
    int yChunk = height! ~/ (noOfPixelsPerAxis + 1);

    for (int j = 1; j < noOfPixelsPerAxis + 1; j++) {
      for (int i = 1; i < noOfPixelsPerAxis + 1; i++) {
        int? pixel = image?.getPixel(xChunk * i, yChunk * j);
        pixels.add(pixel);
        colors.add(abgrToColor(pixel!));
      }
    }
    return colors;
  }
}
