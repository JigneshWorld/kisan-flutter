import 'package:flutter/material.dart';
import 'data_manager.dart';

class ManageCropPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ManageCropPageState();
  }
}

class _ManageCropPageState extends State<ManageCropPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController cropNameController =
      new TextEditingController();
        final TextEditingController farmerNameController =
      new TextEditingController();

        final TextEditingController cropNoteController =
      new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Crop"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: cropNameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
              ),
              TextFormField(
                controller: farmerNameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
              ),
              TextFormField(
                controller: cropNoteController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  child: Text("SAVE"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      addCrop(cropNameController.text, farmerNameController.text, cropNoteController.text)
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
