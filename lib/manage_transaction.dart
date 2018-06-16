import 'package:flutter/material.dart';
import 'data_manager.dart';

class ManageTransactionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ManageTransactionPageState();
  }
}

class _ManageTransactionPageState extends State<ManageTransactionPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController noteController = new TextEditingController();
  final TextEditingController amountController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  String txnType = 'expense';

  void handleTxnTypeValueChanged(String value) {
    setState(() {
      txnType = value;
    });
  }

  String paymentStatus = 'unpaid';
  void handlePaymentStatusValueChanged(String value) {
    setState(() {
      paymentStatus = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Transaction"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Amount'),
                  new Flexible(
                    child: TextFormField(
                      controller: amountController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  new SizedBox(
                    width: 200.0,
                    child: RadioListTile<String>(
                      title: Text("Expense"),
                      groupValue: txnType,
                      value: 'expense',
                      onChanged: handleTxnTypeValueChanged,
                    ),
                  ),
                  new SizedBox(
                    width: 200.0,
                    child: RadioListTile<String>(
                      title: Text("Income"),
                      groupValue: txnType,
                      value: 'income',
                      onChanged: handleTxnTypeValueChanged,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Category"),
                  DropdownButton<String>(
                    hint: Text('Select Category'),
                    items: List<DropdownMenuItem<String>>.generate(5, (index) {
                      return DropdownMenuItem<String>(
                        value: "Item - $index",
                        child: Text("Item - $index"),
                      );
                    }),
                    onChanged: (_) {},
                  )
                ],
              ),
              TextFormField(
                controller: noteController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
              ),
              Row(
                children: <Widget>[
                  new SizedBox(
                    width: 200.0,
                    child: RadioListTile<String>(
                      title: Text("Unpaid"),
                      groupValue: paymentStatus,
                      value: 'unpaid',
                      onChanged: handlePaymentStatusValueChanged,
                    ),
                  ),
                  new SizedBox(
                    width: 200.0,
                    child: RadioListTile<String>(
                      title: Text("Paid"),
                      groupValue: paymentStatus,
                      value: 'paid',
                      onChanged: handlePaymentStatusValueChanged,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  child: Text("SAVE"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      addTransaction(
                          int.parse(amountController.text),
                          txnType,
                          "category",
                          noteController.text,
                          paymentStatus,
                          DateTime.now()).then((_) {
                        Navigator.pop(context);
                      }).catchError((e) => print(e));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
