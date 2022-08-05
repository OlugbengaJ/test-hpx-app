import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/models/apps/zlightspace_models/profiles/profiles_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/utils/constants.dart';
import 'package:hpx/utils/datetime_util.dart';

/// [ProfileProvider] allows to manage profiles
///
/// A profile would contain several layers and their states,
/// which allows a user to persist different customizations
/// as different profiles, and change from one to another.
class ProfileProvider extends ChangeNotifier {
  LayersProvider? _layersProvider;
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


  setLayersProvider(LayersProvider layersProvider) {
    _layersProvider = layersProvider;
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
