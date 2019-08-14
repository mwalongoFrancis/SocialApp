import 'package:flutter/material.dart';
import 'package:pt_project_1/models/user.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin SocialAppConnectedModel on Model {}

mixin Album_model on SocialAppConnectedModel {}

mixin Category_model on SocialAppConnectedModel {}

mixin Utility_model on SocialAppConnectedModel {
  bool _showSpinner = false;
 
 
  //showSpinner getter
bool get showSpinner => _showSpinner;

//showSpinner setter
toggleShowSpinner(){
  _showSpinner = !_showSpinner;
  notifyListeners();
}
}

mixin User_model on SocialAppConnectedModel {
  PublishSubject<bool> _userSubject = PublishSubject();
  final String _userEmail = "developer@gmail.com";
  final String _password = "123";
  User _user;

  void login({@required String email, @required String password})async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if(email == _userEmail && password == _password){
      _user = 
      User(avatar: 'assets/images/majumba.jpg', email: email, id: 1, name: 'Developer', token: 'bbb222ccc333ddd');
      pref.setInt('id', _user.id);
      pref.setString('name', _user.name);
      pref.setString('email', _user.email);
      pref.setString('avatar', _user.avatar);
      pref.setString('token', _user.token);
      _userSubject.add(true);
      notifyListeners();
    }
  }

  void logout() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    _userSubject.add(false);
    pref.clear();
    notifyListeners();
  }

  //publishSubject getter
  PublishSubject get userSubject => _userSubject;

}
