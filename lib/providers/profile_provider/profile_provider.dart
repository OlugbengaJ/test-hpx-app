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

  late Profile _selectedProfile = _defaultProfile;
  Profile get selectedProfile => _selectedProfile;

  Profile get _defaultProfile => profiles.first.copyWith(
        id: _nextId,
        name: '${Constants.defaultText} (1)',
        icon: '',
        layers: [],
        associatedApps: [],
      );

  Profile get currentProfile {
    try {
      return _currentProfile;
    } catch (e) {
      _currentProfile = profiles.first;
    }

    return _currentProfile;
  }

  void resetSelectedProfile() {
    _selectedProfile = _defaultProfile;
  }

  void addProfile(String textEditName) {
    Profile profile = Profile(
      id: _selectedProfile.id,
      name: textEditName,
      icon: _selectedProfile.icon,
      layers: _selectedProfile.layers,
      associatedApps: _selectedProfile.associatedApps,
    );

    _profiles.add(profile);
    _currentProfile = profile;

    notifyListeners();
  }

  void deleteProfile(int id) {
    if (id == 0) return;
    _profiles.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  void renameProfile(String name) {}

  void selectProfile(int id) {
    _currentProfile = profiles.firstWhere((element) => element.id == id);
    notifyListeners();
  }

  void selectAppAsProfile(String name, String icon, String file) {
    if (name == Constants.defaultText) name = '${Constants.defaultText} (1)';

    _selectedProfile = Profile(
      id: _nextId,
      name: name,
      icon: icon,
      layers: [],
      associatedApps:
          file.isEmpty ? [] : [Application(name: name, icon: icon, file: file)],
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
