import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/profiles/profiles_model.dart';
import 'package:hpx/utils/constants.dart';

///[ProfileProvider] to control the layers state
class ProfileProvider extends ChangeNotifier {
  final List<Profile> _profiles = [
    // init with a default profile
    Profile(
      id: 0,
      name: 'Default',
      icon: '',
      layers: [],
      associatedApps: [],
    )
  ];

  /// [profiles] returns the list of profile
  List<Profile> get profiles => [..._profiles];

  int get _nextId => profiles.last.id + 1;

  late Profile _currentProfile;

  late Profile _selectedProfile = profiles.first.copyWith(
    id: _nextId,
    name: '${Constants.defaultText} (1)',
  );

  Profile get selectedProfile => _selectedProfile;

  bool creatingProfile = false;

  // Profile defaultProfile =
  //     Profile(id: 0, name: "Default", layers: [], associatedApps: []);

  // void setProfileName(String name) {
  //   _profileName = name;
  //   notifyListeners();
  // }

  // String get profileName {
  //   if (_profileName.isNotEmpty) {
  //     return _profileName;
  //   }

  //   return profiles.first.name;
  // }

  Profile get currentProfile {
    try {
      return _currentProfile;
    } catch (e) {
      _currentProfile = profiles.first;
    }

    return _currentProfile;
  }

  void addProfile() {
    Profile profile = Profile(
      id: _nextId,
      name: _selectedProfile.name,
      icon: _selectedProfile.icon,
      layers: [],
      associatedApps: [],
    );

    _profiles.add(profile);
    notifyListeners();
  }

  void deleteProfile(int id) {
    if (id == 0) return;

    profiles.removeWhere((p) => p.id == id);
  }

  void renameProfile(String name) {}

  void selectProfile(String name, String icon, String file) {
    if (name == Constants.defaultText) name = '${Constants.defaultText} (1)';

    _selectedProfile = Profile(
      id: _nextId,
      name: name,
      icon: icon,
      layers: [],
      associatedApps: [],
    );

    notifyListeners();
  }

  void setProfileImage() {}

  /// [apps] returns list of default apps including the Z app.
  final List<Application> _systemApps = [
    Application(name: 'Default', icon: '', file: ''),
  ];

  List<Application> get apps => [..._systemApps];

  void addSystemApp(String name, String icon, String file) {
    // don't add existing app
    if (apps.any((element) => element.name == name)) return;

    _systemApps.add(Application(name: name, icon: icon, file: file));
    notifyListeners();
  }
}
