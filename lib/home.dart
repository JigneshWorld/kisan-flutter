import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kisan_flutter/data_manager.dart';
import 'manage_category.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kisan"),
        ),
        body: Center(
          child: new Column(
            children: <Widget>[
              RaisedButton(
                child: Text("Add Category"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ManageCategoryPage()));        
                },
              ),
              RaisedButton(
                child: Text("Add Transaction"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ManageCategoryPage()));        
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
