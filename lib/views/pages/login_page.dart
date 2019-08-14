import 'package:flutter/material.dart';
import 'package:pt_project_1/views/pages/login_screen.dart';
import 'package:pt_project_1/views/pages/sign_up_page.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200,
              ),
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.transparent,
                  child: Image(image: AssetImage('assets/icons/diamond.png'), height: 110,),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'TeamUp',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),

              ),
                Text(
                'The App tagline goes here',
                style: TextStyle(fontSize: 10,),

              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.deepPurple,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'LOG IN',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
              ),
              FlatButton(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                },
              ),
            ],
          ),
        ));
  }
}
