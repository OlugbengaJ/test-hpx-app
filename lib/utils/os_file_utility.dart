import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/globals.dart';
import 'package:hpx/providers/profile_provider/profile_provider.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:hpx/utils/constants.dart';
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
      final filePickerResult = await FilePicker.platform.pickFiles(
        dialogTitle: Constants.selectApp,
        type: FileType.custom,
        initialDirectory: appsDir?.initialDirectory,
        allowedExtensions: appsDir?.extensions,
      );

      processFile(filePickerResult);
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
      final file = result.files.first;
      final profileProvider = Provider.of<ProfileProvider>(
          navigatorKeys.currentContext!,
          listen: false);

      /**
       * Using wmic (Windows Management Instrumentation Concsole)
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
          debugPrint('ps stdout ${processResult.stdout}');
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
