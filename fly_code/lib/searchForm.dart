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
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Flexible(
                child: TextFormField(
                  validator: (_query) {
                    if (_query.isEmpty) {
                      return 'ingrese texto a buscar';
                    }
                    //_query = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: RaisedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState.validate()) {
                      // Process data.

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchPage(_query)),
                      );
                    }
                  },
                  child: Text('Buscar!'),
                ),
              ),
            ]));
  }
}
