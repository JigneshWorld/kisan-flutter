import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kisan_flutter/data_manager.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kisan"),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("Connect using Google"),
            onPressed: () {
              handleSignIn()
                  .then((FirebaseUser user) {
                    print(user);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  })
                  .catchError((e) => print(e));
            },
          ),
        ),
      ),
    );
  }
}
