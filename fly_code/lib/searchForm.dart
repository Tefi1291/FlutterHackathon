import 'package:flutter/material.dart';
import 'package:fly_code/Search.dart';

class SearchForm extends StatefulWidget {
  SearchForm({Key key}) : super(key: key);

  _SearchForm createState() => _SearchForm();
}

class _SearchForm extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();

  String _query;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: _formKey,
        child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'ingrese texto a buscar';
                  }
                  _query = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState.validate()) {
                      // Process data.
                      print("ot tap");
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage(_query)),
                      );
                    }
                  },
                  child: Text('Buscar!'),
                ),
              ),
            ]));
  }
}
