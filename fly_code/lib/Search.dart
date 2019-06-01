import 'package:flutter/material.dart';
import 'api_client.dart';
import 'package:fly_code/models/faqs.dart';

import 'searchDetail.dart';

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
            list= FilterElems(list);
            return ListView.builder(itemBuilder: (context, index) =>
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white12.withOpacity(0.5),
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 0.25),
                    ),
                  ),
                  height: 75.0,
                  child: ListTile(
                    title: Center(
                      child: Text(list[index].title),
                    ),
                    onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchDetail()),
                    ),
                  ),
                ),
              itemCount: list.length
            );
          })
    );
  }

  List<Faqs> FilterElems(List<Faqs> list)
  {
    return list.where( (e) => e.title.contains(this.query)).toList();
  }
}