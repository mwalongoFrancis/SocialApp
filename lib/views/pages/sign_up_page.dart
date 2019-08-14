import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pt_project_1/constants/constants.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmPasswordFocusNode = FocusNode();

  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  TextEditingController _confirmPasswordTextEditingController =
      TextEditingController();
  bool _isObscure = true;

  final _signupPagekey = GlobalKey<FormState>();
  final _passwordPagekey = GlobalKey<FormFieldState>();
  final _confirmPasswordPagekey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.deepPurple),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _signupPagekey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Center(
                child: Text(
                  'TeamUp',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Please fill in all details',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, top: 10, right: 40, bottom: 10),
                child: TextFormField(
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
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, top: 10, right: 40, bottom: 10),
                child: TextFormField(
                  key: _confirmPasswordPagekey,
                  focusNode: _confirmPasswordFocusNode,
                  controller: _confirmPasswordTextEditingController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "password required";
                    } else if (_passwordPagekey.currentState.value !=
                        _confirmPasswordPagekey.currentState.value) {
                          return "password does not match";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'confirm password',
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
                        child: Text('SIGN UP',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 25,
                                color: Colors.white)),
                        onPressed: () {
                          if (_signupPagekey.currentState.validate()) {
                            Navigator.pushNamed(context, homePage);
                          } else {
                            print('error');
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
