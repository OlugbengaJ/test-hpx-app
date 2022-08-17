import 'dart:io';
import 'package:hpx/apps/z_light/globals.dart';
import 'package:hpx/providers/profile_provider/profile_provider.dart';
import 'package:hpx/utils/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';


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
      dialogTitle: Constants.pickImageProfile,
      type: FileType.image,
    );

    if (filePickerResult != null) {
      File file = File(filePickerResult.files.single.path!);

      // Save the file to a new location
      // TODO: Need to refactor this part
      final directory = await getApplicationDocumentsDirectory();   
      if(isLinux){
        File newFile = File('${directory.path}/${profileProvider.selectedProfile.name}.${filePickerResult.files.single.extension}');
        newFile.writeAsBytes(await file.readAsBytes());

        if(newFile.existsSync()){
          profileProvider.updateSelectedProfile(profileProvider.selectedProfile.name, newFile.path, '');
        }
        profileProvider.updateSelectedProfile(profileProvider.selectedProfile.name, newFile.path, '');
        
      }
      if(isWindows){
        File newFile = File('${directory.path}/name.${filePickerResult.files.single.extension}');
        newFile.writeAsBytes(await file.readAsBytes());
        if(newFile.existsSync()){
          profileProvider.updateSelectedProfile(profileProvider.selectedProfile.name, newFile.path, '');
        }
        
        profileProvider.updateSelectedProfile(profileProvider.selectedProfile.name, newFile.path, '');

      }
      

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