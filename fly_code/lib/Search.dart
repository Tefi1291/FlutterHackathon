import 'package:flutter/material.dart';
import 'api_client.dart';
import 'package:fly_code/models/faqs.dart';

class SearchPage extends StatelessWidget
{
  final String query;
  /// En este layout mostrariamos los resultados provenientes de "query"
  SearchPage(this.query);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getFaqs(),
          builder: (context, snapshot) {
            List<Faqs> list = [];
            if(!snapshot.hasData)
              return Text("NO DATA");
            list = snapshot.data;
            return ListView.builder(itemBuilder: (context, index) =>
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: 20.0
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(list[index].title)
                    ],
                  ),
                )
            );
          })
    );
  }

}