import 'package:flutter/material.dart';
import 'package:kisan_flutter/data_manager.dart';
import 'manage_crop.dart';

class CropsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CropsPageState();
  }
}

class _CropsPageState extends State<CropsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Crops"),
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Flexible(
              child: FutureBuilder(
                future: listCrops(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Crop>> snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data[index].toString()),
                        );
                      },
                    );
                  } else {
                    return Text('Loading Crops');
                  }
                },
              ),
            ),
            RaisedButton(
              child: Text("Add Crops"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ManageCropPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
