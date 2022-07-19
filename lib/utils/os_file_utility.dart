import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/globals.dart';
import 'package:hpx/providers/profile_provider/profile_provider.dart';
import 'package:hpx/utils/constants.dart';
import 'package:provider/provider.dart';

class OSFileUtility {
  static bool get isWindows => Platform.isWindows;

  static bool get isLinux => Platform.isLinux;

  static bool get isMac => Platform.isMacOS;

  static String get path => Platform.script.path;

  static AppDirInfo? get appsDir {
    debugPrint('os=> ${Platform.operatingSystem}'
        ' os version=> ${Platform.operatingSystemVersion}'
        ' version=> ${Platform.version}');

    String path = '';

    // Windows app dir info
    if (isWindows) {
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

  // TODO: refactor this to read all apps from default location
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

  static void openFilePicker() async {
    if (appsDir != null) {
      final filePickerResult = await FilePicker.platform.pickFiles(
        dialogTitle: Constants.selectAppTitle,
        type: FileType.custom,
        initialDirectory: appsDir?.initialDirectory,
        allowedExtensions: appsDir?.extensions,
      );

      processFile(filePickerResult);
    }
  }

  static void processFile(FilePickerResult? result) {
    if (isWindows) _processWindowsFile(result);
    if (isLinux) _processLinuxFile(result);
  }

  static final profileProvider = Provider.of<ProfileProvider>(
      navigatorKeys.currentContext!,
      listen: false);

  /// [_processLinuxFile] process Linux specific file
  static void _processLinuxFile(FilePickerResult? result) async {
    if (result != null) {
      for (var file in result.files) {
        final f = File(file.path!);
        if (f.existsSync()) {
          // read each line in .desktop file
          f.readAsLines().then((value) {
            final appInfo = <String, String>{};
            String section = '';

            for (var text in value) {
              if (section.contains('[desktop entry]')) {
                final entry = text.split('=');

                // only name and icon are required.
                final k = appInfo.keys.where((e) => e == 'name' || e == 'icon');
                if (k.length == 2) break;

                if (entry.length == 2) {
                  // add key value pair
                  appInfo[entry.first.toLowerCase()] = entry.last;
                }
              }

              if (text.startsWith('[')) {
                // quit on any other section
                if (section.isNotEmpty) break;

                // adds first section.
                section = text.toLowerCase();
              }
            }

            profileProvider.addSystemApp(
              appInfo['name']!,
              _getLinuxIcon(appInfo['icon']!),
              file.path!,
            );
          });
        }
      }
    }
  }

  static String _getLinuxIcon(String? path) {
    path ??= '';

    final f = File(path);
    if (!f.existsSync()) {
      // icon not found; find it from other dir based on dimentions mxn.
      // e.g. /usr/share/icons/hicolor/48x48/apps
      final List<String> iconDirs = [
        '/usr/share/icons/hicolor',
        '/usr/share/icons/Humanity',
        '/usr/share/icons/gnome',
        '/usr/share/icons/Yaru',
        '/usr/share/pixmaps',
      ];

      // check icon in each root directory
      bool iconFound = false;
      for (var dir in iconDirs) {
        final d = Directory(dir);
        if (d.existsSync()) {
          // if dir exists, check file name
          final fileList = d.listSync(recursive: true, followLinks: false);

          for (var f in fileList) {
            if (f.path.contains('16x16') ||
                f.path.contains('22x22') ||
                f.path.contains('24x24') ||
                f.path.contains('scalable')) {
              // exclude low resolution icons
              continue;
            }

            if (f.path.contains('$path.png') ||
                f.path.contains('$path.jpg') ||
                f.path.contains('$path.svg')) {
              path = f.path;
              iconFound = true;

              break;
            }
          }
        }

        if (iconFound) break;
      }

      // icon does not exist in any dir.
      if (!iconFound) path = '';
    }

    return path!;
  }

  /// [_processWindowsFile] process Windows specific file
  static void _processWindowsFile(FilePickerResult? result) {
    if (result != null) {
      final file = result.files.first;

      /**
       * # READ BELOW TO UNDERSTAND HOW APP NAMES WERE GENERATED IN WINDOWS.
       * 
       * 
       * Using wmic (Windows Management Instrumentation Console)
       * to get properties of the EXE file.
       * e.g.
       * wmic datafile where name='C:\\Program Files\\WINWORD.EXE' list full
       * wmic datafile where name='C:\\Program Files\\WINWORD.EXE' list /format:list
       * wmic product get name,version
       * 
       * e.g.
       * 
       * final file =
       *     "name='${result.files.first.path?.replaceAll(RegExp(r'\\'), '\\\\')}'";
       * debugPrint('file regex: $file');
       * Process.run('wmic', ['datafile', 'where', file, 'list', 'full'])
       *     .then((ProcessResult value) {
       *   if (value.exitCode == 0) {
       *     debugPrint('stdout ${value.stdout}');
       *   } else {
       *     debugPrint('stderr ${value.stderr}');
       *     debugPrint('exit code: ${value.exitCode}');
       *   }
       * }).catchError((e) {});
       * 
       */

      /**
       * Using Shell object via Powershell
       * 
       * 
       * ## To run Powershell command via cmd process.
       * 
       * Powershell -Command "$Shell = New-Object -COMObject Shell.Application; 
       * $ShellFolder = $Shell.NameSpace('C:\Program Files\Google\Chrome\Application'); 
       * $ShellFile = $ShellFolder.ParseName('chrome.exe'); 
       * Write-Host $ShellFile.ExtendedProperty('infotip')"
       * 
       * 
       * Here is a reference to win32 shell
       * https://docs.microsoft.com/en-us/windows/win32/shell/shellfolderitem-extendedproperty
       * 
       * 
       * ## To run directly in Powershell
       * 
       * $Shell = New-Object -COMObject Shell.Application
       * $ShellFolder = $Shell.NameSpace("C:\Program Files\Google\Chrome\Application")
       * $ShellFile = $ShellFolder.ParseName("chrome.exe")
       * Write-Host $ShellFile.ExtendedProperty("infotip")
       * 
       * infotip returns a summary so you could substitute with
       * e.g. company, filedescription, productname, name, type, size, productversion.
       * 
       * 
       * ## To run from a ps1 file
       * ## (WOULD NOT WORK IF "...running scripts is disabled on this system")
       * 
       * void main() {
       *   print(runPowerShellScript(r'C:\tmp\SumScript.ps1', ['1', '2']));
       *   // $sum from Powershell
       *   // 3
       * }
       * 
       * String runPowerShellScript(String scriptPath, List<String> argumentsToScript) {
       *   return Process.runSync(
       *           'Powershell.exe', ['-File', scriptPath, ...argumentsToScript]).stdout
       *       as String;
       * }
       * 
       * // Powershell Code: 
       * $Shell = New-Object -COMObject Shell.Application
       * $ShellFolder = $Shell.NameSpace($args[0])
       * $ShellFile = $ShellFolder.ParseName($args[1])
       * $result = $ShellFile.ExtendedProperty("infotip")
       * Write-Host $result
       * return $result
       * 
      */

      final namespace = file.path!.replaceFirst('\\${file.name}', '');
      final shellCmd = '\$Shell = New-Object -COMObject Shell.Application; '
          '\$ShellFolder = \$Shell.NameSpace(\'$namespace\'); '
          '\$ShellFile = \$ShellFolder.ParseName(\'${file.name}\'); '
          'Write-Host \$ShellFile.ExtendedProperty(\'filedescription\')';

      // execute Powershell .ps1 file
      Process.run('Powershell.exe', ['-Command', shellCmd])
          .then((processResult) {
        if (processResult.exitCode == 0) {
          profileProvider.addSystemApp(
              processResult.stdout as String, '', file.path!);
        }
      }).catchError((e) {
        debugPrint('powershell error occured');
      });
    }
  }
}

class AppDirInfo {
  const AppDirInfo({this.extensions, this.initialDirectory});

  final List<String>? extensions;
  final String? initialDirectory;
}
