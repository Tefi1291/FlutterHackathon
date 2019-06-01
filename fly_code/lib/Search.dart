import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget
{
  final String query;
  /// En este layout mostrariamos los resultados provenientes de "query"
  SearchPage(this.query);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text(this.query)
    );
  }

}