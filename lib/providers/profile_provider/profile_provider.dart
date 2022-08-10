import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/profiles/profiles_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/utils/constants.dart';
import 'package:hpx/utils/datetime_util.dart';
import 'package:hpx/utils/database_manager.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:process_run/shell.dart';

/// [ProfileProvider] allows to manage profiles
///
/// A profile would contain several layers and their states,
/// which allows a user to persist different customizations
/// as different profiles, and change from one to another.
class ProfileProvider extends ChangeNotifier {
  bool get isWindows => Platform.isWindows;

  bool get isLinux => Platform.isLinux;

  bool get isMac => Platform.isMacOS;


  LayersProvider? _layersProvider;
  WorkspaceProvider? _workspaceProvider;
  final List<Profile> _profiles = [
    // init with a default profile
    Profile(
        id: 0,
        name: 'Default',
        icon: '',
        layers: [],
        associatedApps: [],
        createdDate: DateTimeUtil.utc
    )
  ];

  ProfileProvider()  {
    prePopulateProfiles();
  }

  setLayersProvider(LayersProvider layersProvider) {
    _layersProvider = layersProvider;
  }

  setWorkspaceProvider(WorkspaceProvider workspaceProvider) {
    _workspaceProvider = workspaceProvider;
  }

  /// [profiles] returns the list of profile
  List<Profile> get profiles => [..._profiles];

  int get _nextId => profiles.last.id + 1;

  bool allowEdit = true;

  /// [currentProfile] returns the value ([_currentProfile])
  /// of the currently active profile.
  late Profile _currentProfile;
  Profile get currentProfile {
    try {
      return _currentProfile.copyWith();
    } catch (e) {
      _currentProfile = profiles.first.copyWith();
    }
    return _currentProfile;
  }

  /// [selectedProfile] returns a profile ([_selectedProfile])
  /// that is being edited and has not been added to the actual [profiles] list.
  late Profile _selectedProfile = _defaultProfile;
  Profile get selectedProfile => _selectedProfile;

  /// [_defaultProfile] returns a default profile
  /// used for creating a new profile.
  Profile get _defaultProfile => profiles.first.copyWith(
    id: _nextId,
    name: '${Constants.defaultText} (1)',
    icon: '',
    layers: [],
    associatedApps: [],
  );

  /// [resetSelectedProfile] restores [_selectedProfile] to the default.
  void resetSelectedProfile() {
    _selectedProfile = _defaultProfile;
  }

  /// [profileExists] checks if a profile,
  /// other than the selected profile, exists with name.
  bool profileExists(String name) {
    return profiles.any((element) =>
    element.name == name.trim() && element.id != _selectedProfile.id);
  }

  /// [addProfile] adds a new profile to the profiles list.
  void addProfile(String textEditName) {
    if (profileExists(textEditName) || textEditName.isEmpty) return;

    Profile profile = Profile(
      id: _selectedProfile.id,
      name: textEditName.trim(),
      icon: _selectedProfile.icon.trim(),
      layers: _selectedProfile.layers,
      associatedApps: [
        ..._selectedProfile.associatedApps.map((e) => e.copyWith())
      ],
      createdDate: DateTimeUtil.utc,
    );

    _profiles.add(profile);
    selectProfile(profile.id);
    DatabaseManager.createProfile(profile);
    notifyListeners();
  }

  /// [deleteProfile] removes a profile with matching [id] from [profiles].
  void deleteProfile(int id) {
    if (id == 0) return;

    _profiles.removeWhere((p) => p.id == id);
    if (id == _currentProfile.id) {
      // current profile was deleted hence change to default profile
      _currentProfile = profiles.first.copyWith();
    }
    DatabaseManager.deleteItem('profiles', id);
    notifyListeners();
  }

  /// [duplicateProfile] creates a new profile from an existing profile.
  void duplicateProfile(int id) {
    final profile = profiles.firstWhere((e) => e.id == id);

    // set selected profile as new profile but keeping the existing layers.
    _selectedProfile = profile.copyWith(
      id: _nextId,
      name: _defaultProfile.name,
      icon: _defaultProfile.icon,
      associatedApps: [],
    );
    notifyListeners();
  }

  void renameProfile(String name) {}

  /// [selectProfile] sets the current profile to the selected profile
  /// from the list of profiles.
  void selectProfile(int id) {
    _currentProfile = profiles.firstWhere((element) => element.id == id);
    _selectedProfile = _currentProfile;
    _layersProvider!.getProfileLayers(); // Update layers when profile changes
    notifyListeners();
  }

  String? selectedApp;

  /// [updateSelectedProfile] updates the [_selectedProfile].
  ///
  /// This is used when user clicks on an app in the New Profile window.
  void updateSelectedProfile(String name, String icon, String file) {
    selectedApp = name;
    if (name == Constants.defaultText) {
      // update the default name to include number (1)
      name = _defaultProfile.name;
    }

    // disables editing when default app is not selected
    allowEdit = name == _defaultProfile.name;

    _selectedProfile = Profile(
      id: _selectedProfile.id,
      name: name,
      icon: icon,
      // use existing layers incase duplicate profile mode is active
      layers: _selectedProfile.layers,
      associatedApps: file.isEmpty
          ? []
          : [
        Application(
            name: name,
            icon: icon,
            file: file,
            createdDate: DateTimeUtil.utc)
      ],
    );

    DatabaseManager.createProfile(_selectedProfile);
    notifyListeners();
  }

  /// [sortProfiles] sorts [_profiles] by a given [SortOrder]
  ///
  /// e.g. [SortOrder.asc] sorts profiles by name in ascending order,
  /// and [SortOrder.leastRecently] sorts by created date with least first.

  void sortProfiles(SortOrder sortOrder) {
    switch (sortOrder) {
      case SortOrder.asc:
        _profiles.sort((a, b) {
          if (a.name == Constants.defaultText) return -1;
          return a.name.compareTo(b.name);
        });
        break;
      case SortOrder.desc:
        _profiles.sort((a, b) {
          if (a.name == Constants.defaultText) return -1;
          return b.name.compareTo(a.name);
        });
        break;
      case SortOrder.mostRecently:
        _profiles.sort((a, b) {
          if (a.createdDate == null) return -1;
          if (b.createdDate == null) return -1;

          return b.createdDate!.compareTo(a.createdDate!);
        });
        break;
      case SortOrder.leastRecently:
        _profiles.sort((a, b) {
          if (a.createdDate == null) return -1;
          if (b.createdDate == null) return -1;

          return a.createdDate!.compareTo(b.createdDate!);
        });
        break;
      default:
    }

    profileSort = sortOptions.firstWhere((e) => e.sortOrder == sortOrder);
    notifyListeners();
  }

  /// [apps] returns list of default apps including the Z app.
  List<Application> get apps => [..._systemApps];
  final List<Application> _systemApps = [
    Application(name: 'Default', icon: '', file: ''),
  ];


  /// Should be called when the app is first launched
  /// [getSystemApps] fetch all applications installed on the OS
  void getSystemApps() async {
    if(isLinux){
      var result = await Process.run('ls', ['/usr/share/applications/']);
      List<String> listApps = result.stdout.toString().split("\n");
      final dir = Directory('/usr/share/applications/');

      for (var i = 0; i < listApps.length; i++) {
        File f =  File("${dir.path}${listApps[i]}");
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

            try {
              addSystemApp(
                appInfo['name']!,
                _getLinuxIcon(appInfo['icon']!),
                f.path,
              );
            } catch (e) {
              //
            }
            
          });
        }
      }
    }

    if (isWindows) {
      var shell = Shell();
      await shell.run("wmic product get name").then((value){
        List<String> resultToList = value.outText.toString().split("\n");
        // Start with index 1 cause the first element is 'Name'
        for (var i = 1; i < resultToList.length; i++) {
          if(resultToList[i] !="" && resultToList[i] != "Name"){
            try {
              addSystemApp(
                resultToList[i].trim(),
                "",
                "",
              );
            } catch (e) {
              //              
            }
          }          
        }
      });
     
    }
    
  }



  /// [addSystemApp] adds a new [Application] to [apps].
  void addSystemApp(String name, String icon, String file) {
    // don't add existing app
    if (apps.any((element) => element.name == name)) return;

    _systemApps.add(Application(
        name: name, icon: icon, file: file, createdDate: DateTimeUtil.utc));
    notifyListeners();
  }

  /// [sortApps] sorts [_systemApps] by a given [SortOrder]
  ///
  /// e.g. [SortOrder.asc] sorts apps by name in ascending order,
  /// and [SortOrder.leastRecently] sorts by created date with least first.
  void sortApps(SortOrder sortOrder) {
    switch (sortOrder) {
      case SortOrder.asc:
        _systemApps.sort((a, b) {
          if (a.name == Constants.defaultText) return -1;
          return a.name.compareTo(b.name);
        });
        break;
      case SortOrder.desc:
        _systemApps.sort((a, b) {
          if (a.name == Constants.defaultText) return -1;
          return b.name.compareTo(a.name);
        });
        break;
      case SortOrder.mostRecently:
        _systemApps.sort((a, b) {
          if (a.createdDate == null) return -1;
          if (b.createdDate == null) return -1;

          return b.createdDate!.compareTo(a.createdDate!);
        });
        break;
      case SortOrder.leastRecently:
        _systemApps.sort((a, b) {
          if (a.createdDate == null) return -1;
          if (b.createdDate == null) return -1;

          return a.createdDate!.compareTo(b.createdDate!);
        });
        break;
      default:
    }

    appSort = sortOptions.firstWhere((e) => e.sortOrder == sortOrder);
    notifyListeners();
  }

  /// [appSort] is the sort value used by [_systemApps].
  late SortOption appSort = sortOptions.last;

  /// [profileSort] is the sort value used by [_profiles].
  late SortOption profileSort = sortOptions.last;

  /// [sortOptions] defines list of sorts available.
  final List<SortOption> sortOptions = [
    const SortOption(title: 'A - Z', sortOrder: SortOrder.asc),
    const SortOption(title: 'Z - A', sortOrder: SortOrder.desc),
    const SortOption(title: 'Most Recently', sortOrder: SortOrder.mostRecently),
    const SortOption(
        title: 'Least Recently', sortOrder: SortOrder.leastRecently),
  ];

  void updateProfileByAddingLayer(LayerItemModel layer) {
    if (!_currentProfile.layers.contains(layer)) {
      _currentProfile.layers.add(layer);
    }
    DatabaseManager.createProfile(_currentProfile);
  }

  void updateProfileByRemovingLayer(LayerItemModel layer) {
    if (_currentProfile.layers.contains(layer)) {
      _currentProfile.layers.remove(layer);
    }
    DatabaseManager.deleteItem('layers', layer.id);
  }

  prePopulateProfiles() async {
    final profilesFromDB = await DatabaseManager.getAllProfiles();
    for (Profile p in profilesFromDB) {
      _layersProvider?.layeritems.addAll(p.layers);
      if(p.name != 'Default') _profiles.add(p);
    }
    notifyListeners();
  }

  Future<void> exportProfile(int id) async {
    final p = profiles.firstWhereOrNull((element) => element.id == id);
    String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Your File to desired location',
        fileName: '${p?.name}.json');
    try {
      io.File returnedFile = io.File(outputFile!);
      await returnedFile.writeAsString(jsonEncode(p?.toMap()),
          mode: io.FileMode.write, flush: true);
    } catch (e) {
      debugPrint("Unable to save profile");
    }
  }

  importProfile(String filePath) {
    File(filePath).readAsString().then((String contents) async {
      Map<String, dynamic> profileJson = jsonDecode(contents);
      profileJson['id'] = await DatabaseManager.getNextAvailableId('profiles');
      int firstLayerId = await DatabaseManager.getNextAvailableId('layers');
      int firstModeId = await DatabaseManager.getNextAvailableId('tools_mode');;

      for (var layer in profileJson['layers']) {
        layer['id'] = firstLayerId++;
        layer['mode']['id'] = firstModeId++;
      }

      final newProfile = Profile.fromJson(profileJson);
      _layersProvider?.layeritems.addAll(newProfile.layers);
      _profiles.add(newProfile);
      await DatabaseManager.createProfile(newProfile);
      notifyListeners();
    });
  }
}

enum SortOrder {
  /// [asc] sort in asending order
  asc,

  /// [desc] sort in desending order
  desc,

  /// [leastRecently] sort by least recent (applicable where date is used)
  leastRecently,

  /// [mostRecently] sort by most recent (applicable where date is used)
  mostRecently,
}

class SortOption {
  const SortOption({Key? key, required this.title, required this.sortOrder});

  final String title;
  final SortOrder sortOrder;
}



  String _getLinuxIcon(String? path) {
    path ??= '';

    final f = File(path);
    if (!f.existsSync()) {
      // icon not found; find it from other dir based on dimentions mxn.
      // e.g. /usr/share/icons/hicolor/48x48/apps
      // Flatpak apps: /var/lib/flatpak/exports/share/applications/
      // Snap apps: /var/lib/snapd/desktop/applications/
      // Wine: ~/.local/share/applications/wine/Programs/
      final List<String> iconDirs = [
        '/usr/share/icons/Humanity',
        '/usr/share/icons/Yaru',
        '/usr/share/icons/gnome',
        '/usr/share/icons/Adwaita',
        '/usr/share/icons/HighContrast',
        '/usr/share/icons/hicolor',
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
                f.path.contains('24x24')) {
              // exclude low resolution icons
              continue;
            }

            if (f.path.contains(RegExp('${path!}(.*).(jpg|png|svg)'))) {
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