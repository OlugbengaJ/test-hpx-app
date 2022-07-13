import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/profiles/profiles_model.dart';
import 'package:hpx/utils/constants.dart';

///[ProfileProvider] to control the layers state
class ProfileProvider extends ChangeNotifier {
  final List<Profile> _profiles = [
    // init with a default profile
    Profile(
      id: 0,
      name: "Default",
      imageUrl: Constants.zImage,
      layers: [],
      associatedApps: [],
    )
  ];

  /// [profiles] returns the list of profile
  List<Profile> get profiles => [..._profiles];

  late Profile _currentProfile;

  bool creatingProfile = false;

  int profileID = 0;
  String _profileName = '';
  String _imageUrl = '';

  // Profile defaultProfile =
  //     Profile(id: 0, name: "Default", layers: [], associatedApps: []);

  void setProfileName(String name) {
    _profileName = name;
    notifyListeners();
  }

  String get profileName {
    if (_profileName.isNotEmpty) {
      return _profileName;
    }

    return profiles.first.name;
  }

  Profile get currentProfile {
    try {
      return _currentProfile;
    } catch (e) {
      _currentProfile = profiles.first;
    }

    return _currentProfile;
  }

  int get _nextId {
    int id = 0;
    for (var p in profiles) {
      if (p.id > id) id = p.id;
    }

    return id + 1;
  }

  void addProfile() {
    Profile profile = Profile(
      id: _nextId,
      name: _profileName,
      imageUrl: _imageUrl,
      layers: [],
      associatedApps: [],
    );

    _profiles.add(profile);
    notifyListeners();
  }

  void deleteProfile(int id) {
    if (profileID == 0) return;

    profiles.removeWhere((p) => p.id == id);
  }

  void renameProfile(String name) {}

  void setProfileImage() {}
}
