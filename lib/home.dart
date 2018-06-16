import 'package:flutter/material.dart';
import 'manage_category.dart';
import 'categories.dart';
import 'crops.dart';
import 'transactions.dart';

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
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              child: Text("Categories"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoriesPage()));
              },
            ),
            RaisedButton(
              child: Text("Crops"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CropsPage()));
              },
            ),
            RaisedButton(
              child: Text("Transactions"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TransactionsPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
