import 'package:flutter/material.dart';

class UserInfo {
  String nickname;
  int level;
  String imageURL;

  UserInfo(this.nickname,this.level,this.imageURL);
}

class FHUserViewModel with ChangeNotifier {

  UserInfo _user;

  FHUserViewModel(this._user);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;

    notifyListeners();
  }

}