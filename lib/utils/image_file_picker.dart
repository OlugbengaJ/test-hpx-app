import 'dart:io';
import 'package:hpx/providers/profile_provider/profile_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

import '../apps/z_light/globals.dart';

class ImageFilePicker{

  static bool get isWindows => Platform.isWindows;

  static bool get isLinux => Platform.isLinux;

  static bool get isMac => Platform.isMacOS;

  static String get path => Platform.script.path;

  static final profileProvider = Provider.of<ProfileProvider>(
      navigatorKeys.currentContext!,
      listen: false);

  static void openFilePicker() async {

    final filePickerResult = await FilePicker.platform.pickFiles(
      dialogTitle: "Pick an image for the profile",
      type: FileType.image,
      //initialDirectory: picturesDir!.initialDirectory,
    );

    if (filePickerResult != null) {
      File file = File(filePickerResult.files.single.path!);

      // Save the file to a new location
      // TODO: Need to refactor this part
      final directory = await getApplicationDocumentsDirectory();      
      File newFile = File("${directory.path}/${profileProvider.selectedProfile.name}.${filePickerResult.files.single.extension}");
      newFile.writeAsBytes(await file.readAsBytes());
      
      profileProvider.updateSelectedProfile(profileProvider.selectedProfile.name, newFile.path, "");

    } else {
      // User canceled the picker
    }    
  }
  

  
}


class PicturesDirInfo{
  const PicturesDirInfo({this.extensions, this.initialDirectory});

  final List<String>? extensions;
  final String? initialDirectory;
}