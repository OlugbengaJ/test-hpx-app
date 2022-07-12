import 'dart:io';

import 'package:flutter/material.dart';
///[ProfileProvider] to controle the layers state

class ProfileModel {
  late String name;
  late File imageFile;
}


class ProfileProvider extends ChangeNotifier {
  List<ProfileModel> profiles = [];

  void addProfile(){

  }

  void setProfileImage(){
    
  }
}
