import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:pt_project_1/constants/constants.dart';
import 'package:pt_project_1/data/scoped_models/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  bool _isObscure = true;

  _launchURL(_url) async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw "could not launch $_url";
    }
  }

  final _loginScreenkey = GlobalKey<FormState>();
  final _emailPagekey = GlobalKey<FormFieldState>();
  final _passwordPagekey = GlobalKey<FormFieldState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.deepPurple,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _loginScreenkey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Center(
                    child: Text(
                      'TeamUp',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Please fill in all details',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      top: 10,
                      right: 40,
                      bottom: 10,
                    ),
                    child: TextFormField(
                      key: _emailPagekey,
                      focusNode: _emailFocusNode,
                      controller: _emailTextEditingController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "email required";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'example@gmail.com',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40, top: 10, right: 40, bottom: 10),
                    child: TextFormField(
                      key: _passwordPagekey,
                      focusNode: _passwordFocusNode,
                      controller: _passwordTextEditingController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "password required";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                              print(_isObscure);
                            },
                            icon: Icon(_isObscure
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'Forget your password?',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    onPressed: () {},
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, top: 50, right: 40, bottom: 10),
                          child: RaisedButton(
                            padding: const EdgeInsets.all(17),
                            shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.deepPurple,
                            child: Text('LOG IN',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 25,
                                    color: Colors.white)),
                            onPressed: () {
                              if (_loginScreenkey.currentState.validate()) {
                                model
                                    .login(
                                        email: _emailTextEditingController.text,
                                        password:
                                            _passwordTextEditingController.text)
                                    .then((value) {
                                  if (value) {
                                    Navigator.pushReplacementNamed(
                                        context, '/');
                                  } else {
                                    model.toggleShowSpinner();
                                    var time = 0;
                                    final t = Timer(Duration(seconds: 3), () {
                                      model.toggleShowSpinner();
                                      time = 3;
                                    });

                                    if (time == 3) {
                                      t.cancel();
                                    }

                                    _scaffoldKey.currentState
                                        .showSnackBar(SnackBar(
                                      content: ListTile(
                                        leading: Icon(Icons.error),
                                        title:
                                            Text('incorrect email or password'),
                                        trailing: Icon(Icons.error,
                                            color: Colors.red),
                                      ),
                                    ));
                                  }
                                });
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                const facebookUrl = "https://facebook.com";
                                _launchURL(facebookUrl);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[100],
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Icon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.lightBlue,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                                onTap: () {
                                  const twitterUrl = "https://twittter.com";
                                  _launchURL(twitterUrl);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[100],
                                      border: Border.all(
                                          width: 1, color: Colors.grey)),
                                  child: Icon(
                                    FontAwesomeIcons.twitter,
                                    color: Colors.pinkAccent,
                                  ),
                                )),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                                onTap: () {
                                  const instagramUrl = "https://instagram.com";
                                  _launchURL(instagramUrl);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[100],
                                      border: Border.all(
                                          width: 1, color: Colors.grey)),
                                  child: Icon(
                                    FontAwesomeIcons.instagram,
                                    color: Colors.pinkAccent,
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
