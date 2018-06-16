import 'package:flutter/material.dart';
import 'package:kisan_flutter/data_manager.dart';
import 'manage_category.dart';

class CategoriesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoriesPageState();
  }
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Flexible(
              child: FutureBuilder(
                future: listCategories(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Category>> snapshot) {
                  if (snapshot.data != null) {
                    print('Got categoris ${snapshot.data.length}');
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data[index].toString()),
                        );
                      },
                    );
                  } else {
                    return Text('Loading Data');
                  }
                },
              ),
            ),
            RaisedButton(
              child: Text("Add Category"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ManageCategoryPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
