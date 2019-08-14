import 'package:flutter/material.dart';
import 'package:pt_project_1/data/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Container(
          child: Center(
            child: RaisedButton(
              color: Colors.redAccent,
              child: Text('LOG OUT'),
              onPressed: () {
                model.logout();
              },
            ),
          ),
        );
      },
    );
  }
}
