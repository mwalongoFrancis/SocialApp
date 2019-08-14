import 'package:flutter/material.dart';
import 'package:pt_project_1/constants/constants.dart';
import 'package:pt_project_1/data/scoped_models/main.dart';
import 'package:pt_project_1/views/pages/home_page.dart';
import 'package:pt_project_1/views/pages/login_page.dart';
import 'package:pt_project_1/views/pages/login_screen.dart';
import 'package:pt_project_1/views/pages/sign_up_page.dart';
import 'package:scoped_model/scoped_model.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final MainModel _model = MainModel();
  bool _isAuthenticated = false;

  @override
//this is called first soon after the constructor
//to be executed automatically before build

  void initState() {
    _model.autoAunthenticate();
    _model.userSubject.listen((value) {
      setState(() {
        _isAuthenticated = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.purple),
        // home: _isAuthenticated ? HomePage() : LoginPage(),
        routes: {
          '/': (BuildContext context) => _isAuthenticated ? HomePage() : LoginPage(),
          loginPage: (BuildContext context) => LoginPage(),
          homePage: (BuildContext context) => HomePage(),
          signUp: (BuildContext context) => SignUpPage(),
          signIn: (BuildContext context) => LoginScreen(),
        },
      ),
      model: _model,
    );
  }
}
