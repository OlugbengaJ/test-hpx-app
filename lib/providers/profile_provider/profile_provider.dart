import 'package:flutter/widgets.dart';
import 'package:hpx/models/apps/zlightspace_models/profiles/profiles_model.dart';

import 'package:flutter/material.dart';
///[ProfileProvider] to controle the layers state


class ProfileProvider extends ChangeNotifier {
  final List<Profile> _profiles = [];
  List<Profile> get profiles => _profiles;
  late Profile currentProfile;
  bool creatingProfile = false;
  String profileName = "";
  int profileID = 0;
  


  Profile defaultProfile = Profile(
    id: 0,
    name: "Default",
    layers: [],
    associatedApps: []

  );

  void setProfileName(String name){
    profileName = name;
    notifyListeners();
  }


  String getProfileName(){
    if(profileName.isNotEmpty){
      return profileName;
    }else{
      return defaultProfile.name;
    }
  }


  Profile getCurrentProfile(){
    currentProfile = Profile(
      id: 1,
      name: "Current",
      layers: [],
      associatedApps: []
    );
    try {
       return currentProfile;
    } catch (e) {
       return defaultProfile;
    }    
  }

  void addProfile(){
    Profile newProfile = Profile(
      id: 1,
      name: profileName,
      layers: [],
      associatedApps: []
    );

    _profiles.add(newProfile);
    notifyListeners();
  }

  void deleteProfile(int profileID){
  }

  void renameProfile(String name){
  }

  void setProfileImage(){
  }


}
