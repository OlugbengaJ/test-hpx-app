import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/globals.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:provider/provider.dart';

class OSFileUtility {
  static bool get isWindows => Platform.isWindows;

  static bool get isLinux => Platform.isLinux;

  static bool get isMac => Platform.isMacOS;

  static String get path => Platform.script.path;

  static AppDirInfo? get appsDir {
    debugPrint(
        '${Platform.operatingSystem} ${Platform.operatingSystemVersion} ${Platform.version}');

    String path = '';

    // Windows app dir info
    if (isWindows) {
      // C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git
      final dir = Directory(
          'c:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs');

      if (dir.existsSync()) {
        path = dir.path;
      } else {
        path = Directory.current.path;
      }

      return AppDirInfo(
        extensions: ['exe'],
        initialDirectory: path,
      );
    }

    // Linux app dir info
    if (isLinux) {
      final dir = Directory('/usr/share/applications/');

      if (dir.existsSync()) {
        path = dir.path;
      } else {
        path = Directory.current.path;
      }

      return AppDirInfo(
        extensions: ['desktop'],
        initialDirectory: path,
      );
    }

    return null;
  }

  static void osApps() {
    final dir = Directory(appsDir!.initialDirectory!);

    List<FileSystemEntity> list =
        dir.listSync(recursive: false, followLinks: true);

    for (var e in list) {
      debugPrint('file path ${e.path}');

      FileStat stat = e.statSync();

      debugPrint('file type ${stat.type}');
      debugPrint('file mode ${stat.modeString()}');
      debugPrint('');
    }
  }

  static List<String> get osAppsIconDir {
    debugPrint(
        '${Platform.operatingSystem} ${Platform.operatingSystemVersion} ${Platform.version}');
    // if (isWindows) return ['c:\\Program Files', 'c:\\Program Files (x86)'];

    // if (isLinux) return ['/usr/share/pixmaps'];

    return [];
  }

  static void openFilePicker() async {
    if (appsDir != null) {
      FilePicker.platform
          .pickFiles(
            dialogTitle: 'Select Application',
            type: FileType.custom,
            initialDirectory: appsDir?.initialDirectory,
            allowedExtensions: appsDir?.extensions,
          )
          .then((result) => processFile(result))
          .catchError((e) {});
    }
  }

  static final appInfo = <String, String>{};

  static void processFile(FilePickerResult? result) {
    if (isWindows) _processWindowsFile(result);
    if (isLinux) _processLinuxFile(result);
  }

  /// [_processLinuxFile] process Linux specific file
  static void _processLinuxFile(FilePickerResult? result) async {
    // process result
    if (result != null) {
      for (var file in result.files) {
        debugPrint('\r\nfile path \t=> ${file.path}');
        debugPrint('file name \t=> ${file.name}');
        debugPrint('file ext \t=> ${file.extension}');

        Process.run('ls', ['-l', '${file.path}']).then((value) {
          if (value.exitCode == 0) {
            debugPrint('stdout ${value.stdout}');
          } else {
            debugPrint('stderr ${value.stderr}');
            debugPrint('exit code: ${value.exitCode}');
          }
        });

        final f = File(file.path!);
        if (f.existsSync()) {
          final workspaceProvider = Provider.of<WorkspaceProvider>(
              navigatorKeys.currentContext!,
              listen: false);

          debugPrint('\r\n\tReading file contents...\r\n');

          List<Widget> widgets = [];
          f.readAsLines().then((value) {
            String section = '';
            appInfo.clear();

            for (var text in value) {
              if (section.contains('[Desktop Entry]')) {
                final entry = text.split('=');
                if (entry.length == 2) {
                  appInfo[entry.first] = entry.last;
                }
              }

              if (text.startsWith('[')) {
                // quit on any other section
                if (section.isNotEmpty) break;

                // adds first section.
                section = text;
              }
            }

            widgets.addAll(appInfo.entries.map((e) {
              if (e.key.toLowerCase() == 'icon') {
                // get icon file
                final iconFound = _processLinuxIcon(e.value);

                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (iconFound.isNotEmpty)
                      Container(
                        margin: EdgeInsets.zero,
                        child: Image.memory(
                          File(e.value).readAsBytesSync(),
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                    Text('${e.key}: ${e.value}'),
                  ],
                );
              }

              return Text('${e.key}: ${e.value}');
            }));

            // open modal
            workspaceProvider.toggleModal(widgets);
          });
        }
      }
    }
  }

  static String _processLinuxIcon(String path) {
    final f = File(path);
    if (!f.existsSync()) {
      // icon not found; find it from other dir based on dimentions mxn.
      final List<String> iconDirs = [
        '/usr/share/icons/hicolor/48x48/apps',
        '/usr/share/icons/Humanity/48x48/apps',
        '/usr/share/icons/gnome/48x48/apps',
        '/usr/share/icons/Yaru/48x48/apps',
      ];
      path = '';
    }

    // icon found
    // final stat = f.statSync();

    return path;
  }

  /// [_processWindowsFile] process Windows specific file
  static void _processWindowsFile(FilePickerResult? result) {
    if (result != null) {
      debugPrint('\r\npicker id ${result.files.map((e) => e.identifier)}');
      debugPrint('\r\npicker name ${result.files.map((e) => e.name)}');
      debugPrint('\r\npicker path ${result.files.map((e) => e.path)}');
      debugPrint(
          '\r\npicker extension ${result.files.map((e) => e.extension)}');

      // TODO: use wmic to list properties of the exe
      // e.g. wmic datafile where "name='C:\\Program Files\\Microsoft Office\\root\\Office16\\WINWORD.EXE'" list full
      final file =
          '"name=\'${result.files.first.path?.replaceAll(RegExp(r'\\'), '\\\\')}\'"';
      debugPrint('file regex: $file');
      // Process.run('wmic', ['datafile', 'where', file, 'list', 'full'])
      Process.run('wmic', ['product', 'get', 'name,version']).then((value) {
        debugPrint('stdout ${value.stdout}');
        debugPrint('stderr ${value.stderr}');
        debugPrint('exit code: ${value.exitCode}');
      }).catchError((e) {});
    }
  }
}

class AppDirInfo {
  const AppDirInfo({this.extensions, this.initialDirectory});

  final List<String>? extensions;
  final String? initialDirectory;
}