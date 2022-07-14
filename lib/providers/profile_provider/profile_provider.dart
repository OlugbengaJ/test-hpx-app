import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/profiles/profiles_model.dart';
import 'package:hpx/utils/constants.dart';

/// [ProfileProvider] allows to manage profiles
///
/// A profile would contain several layers and their states,
/// which allows a user to persist different customizations
/// as different profiles, and change from one to another.
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

  /// [addProfile] adds a new profile to the profiles list.
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

  /// [deleteProfile] removes a profile with matching [id] from [profiles].
  void deleteProfile(int id) {
    if (id == 0) return;

    _profiles.removeWhere((p) => p.id == id);

    if (id == _currentProfile.id) {
      // current profile was deleted hence change to default profile
      _currentProfile = profiles.first.copyWith();
    }

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
    notifyListeners();
  }

  /// [updateSelectedProfile] updates the [_selectedProfile].
  ///
  /// This is used when user clicks on an app in the New Profile window.
  void updateSelectedProfile(String name, String icon, String file) {
    if (name == Constants.defaultText) {
      // update the default name to include number (1)
      name = _defaultProfile.name;
    }

    // disables editing when default app is not selected
    allowEdit = name == _defaultProfile.name;

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

  /// [apps] returns list of default apps including the Z app.
  List<Application> get apps => [..._systemApps];
  final List<Application> _systemApps = [
    Application(name: 'Default', icon: '', file: ''),
  ];

  /// [addSystemApp] adds a new [Application] to [apps].
  void addSystemApp(String name, String icon, String file) {
    // don't add existing app
    if (apps.any((element) => element.name == name)) return;

    _systemApps.add(Application(name: name, icon: icon, file: file));
    notifyListeners();
  }
}
