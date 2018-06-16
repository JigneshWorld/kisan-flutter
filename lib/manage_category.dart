import 'package:flutter/material.dart';
import 'data_manager.dart';

class ManageCategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ManageCategoryPageState();
  }
}

class _ManageCategoryPageState extends State<ManageCategoryPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController categoryNameController =
      new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  String radioValue = 'expense';

  void handleRadioValueChanged(String value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kisan"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: categoryNameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
              ),
              RadioListTile<String>(
                title: Text("Expense"),
                groupValue: radioValue,
                value: 'expense',
                onChanged: handleRadioValueChanged,
              ),
              RadioListTile<String>(
                title: Text("Income"),
                groupValue: radioValue,
                value: 'income',
                onChanged: handleRadioValueChanged,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  child: Text("SAVE"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      addCategory(categoryNameController.text, radioValue)
                          .then((_) {
                            Navigator.pop(context);
                          })
                          .catchError((e) => print(e));
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
