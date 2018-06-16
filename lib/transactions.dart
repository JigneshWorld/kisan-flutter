import 'package:flutter/material.dart';
import 'package:kisan_flutter/data_manager.dart';
import 'manage_transaction.dart';

class TransactionsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransactionsPageState();
  }
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Transactions"),
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Flexible(
              child: FutureBuilder(
                future: listTransactions(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Transaction>> snapshot) {
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
                    return Text('Loading Transactions');
                  }
                },
              ),
            ),
            RaisedButton(
              child: Text("Add Transactions"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ManageTransactionPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
