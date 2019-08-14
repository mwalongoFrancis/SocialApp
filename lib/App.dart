import 'package:flutter/material.dart';
import 'package:pt_project_1/constants/constants.dart';
import 'package:pt_project_1/views/pages/home_page.dart';
import 'package:pt_project_1/views/pages/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: LoginPage(),
      routes: {
        loginPage: (BuildContext context) => LoginPage(),
        homePage: (BuildContext context) => HomePage(),
      },
    );
  }
}
