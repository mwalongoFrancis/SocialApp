import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pt_project_1/api/api.dart';
import 'package:pt_project_1/models/album.dart';
import 'package:pt_project_1/models/user.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

mixin SocialAppConnectedModel on Model {
  List<Album> _availableAlbums;
}

mixin Album_model on SocialAppConnectedModel {
  //gette of albums
  List<Album> get availableAlbums => _availableAlbums;
  //function to fetch albums
  Future<void> getAlbums() async {
    try{
      http.Response response = await http.get(api + 'albums');
    Map<String, dynamic> data = json.decode(response.body);
    print(data);
    }catch(error){
      print('item not found');
    }
    
  }
}

mixin Category_model on SocialAppConnectedModel {}

mixin Utility_model on SocialAppConnectedModel {
  bool _showSpinner = false;

  //showSpinner getter
  bool get showSpinner => _showSpinner;

//showSpinner setter
  toggleShowSpinner() {
    _showSpinner = !_showSpinner;
    notifyListeners();
  }
}

mixin User_model on SocialAppConnectedModel {
  PublishSubject<bool> _userSubject = PublishSubject();
  final String _userEmail = "developer@gmail.com";
  final String _password = "123";
  User _user;

  Future<bool> login(
      {@required String email, @required String password}) async {
    bool _isLogedIn = false;
    final SharedPreferences pref = await SharedPreferences.getInstance();

    //shared pref stores items on the local device eg. mobile phone
    //await prevents the app to break once there are networks barriers

    if (email == _userEmail && password == _password) {
      _user = User(
          avatar: 'assets/images/majumba.jpg',
          email: email,
          id: 1,
          name: 'Developer',
          token: 'bbb222ccc333ddd');
      pref.setInt('id', _user.id);
      pref.setString('name', _user.name);
      pref.setString('email', _user.email);
      pref.setString('avatar', _user.avatar);
      pref.setString('token', _user.token);
      _userSubject.add(true);
      _isLogedIn = true;
      notifyListeners();
    }
    return _isLogedIn;
  }

  void logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    _userSubject.add(false);
    pref.clear();
    notifyListeners();
  }

  Future<void> autoAunthenticate() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String _token = pref.getString("token");
    if (_token.isNotEmpty) {
      _user = User(
          email: pref.getString('email'),
          id: pref.getInt('id'),
          name: pref.getString('name'),
          token: pref.getString('token'),
          avatar: pref.getString('avatar'));
    }
  }

  //publishSubject getter
  PublishSubject get userSubject => _userSubject;
}
