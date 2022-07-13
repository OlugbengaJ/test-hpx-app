import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:hpx/models/apps/zlightspace_models/profiles/profiles_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/utils/database_manager.dart';

import 'package:flutter/material.dart';
///[ProfileProvider] to controle the layers state


class ProfileProvider extends ChangeNotifier {
  List<Profile> _profiles = [];
  List<Profile> get profiles => _profiles;
  late Profile currentProfile;


  Profile defaultProfile = Profile(
    id: 0,
    name: "Default",
    layers: [],
    associatedApps: []

  );


  


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

  }

  void setProfileImage(){
    
  }


}
