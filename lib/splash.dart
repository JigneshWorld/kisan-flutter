import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kisan_flutter/data_manager.dart';
import 'login.dart';
import 'home.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    currentUser().then((FirebaseUser user) {
      if (user != null) {
        print(user);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    }).catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kisan"),
        ),
        body: Center(
          child: Text("Kisan"),
        ),
      ),
    );
  }
}
