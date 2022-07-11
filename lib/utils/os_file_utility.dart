import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class OSFileUtility {
  static bool get isWindows => Platform.isWindows;

  static bool get isLinux => Platform.isLinux;

  static bool get isMac => Platform.isMacOS;

  static String get path => Platform.script.path;

  static AppDirInfo? get appsDir {
    debugPrint(
        '${Platform.operatingSystem} ${Platform.operatingSystemVersion} ${Platform.version}');

    // Windows app dir info
    if (isWindows) {
      return const AppDirInfo(
        extensions: ['.exe'],
        initialDirectory: 'c:\\Program Files',
      );
    }

    // Linux app dir info
    if (isLinux) {
      return const AppDirInfo(
        initialDirectory: '/usr/share/',
      );
    }

    return null;
  }

  static List<String> get osAppsIconDir {
    debugPrint(
        '${Platform.operatingSystem} ${Platform.operatingSystemVersion} ${Platform.version}');
    // if (isWindows) return ['c:\\Program Files', 'c:\\Program Files (x86)'];

    // if (isLinux) return ['/usr/share/pixmaps'];

    return [];
  }

  static void filePicker() async {
    FilePicker.platform
        .pickFiles(
      dialogTitle: 'Select Application',
      type: FileType.custom,
      initialDirectory: appsDir?.initialDirectory,
      allowedExtensions: appsDir?.extensions,
    )
        .then((value) {
      // result received
    }).catchError(() {});
  }
}

class AppDirInfo {
  const AppDirInfo({this.extensions, this.initialDirectory});

  final List<String>? extensions;
  final String? initialDirectory;
}
