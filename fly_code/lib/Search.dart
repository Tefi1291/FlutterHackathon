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
      appBar: AppBar(
        title: Text("Searching $query",),
      ),
      body: FutureBuilder(
        future: getFaqs(query),
        builder: (context, snapshot) {
          List<Faqs> list = [];
          if(!snapshot.hasData)
            return Center(child: Text("NO DATA"),);
          list = snapshot.data;
          return ListView.builder(itemBuilder: (context, index) =>
            _QuestionWidget(list[index]),
            itemCount: list.length
          );
        })
    );
  }
}

class _QuestionWidget extends StatelessWidget {
  final Faqs faqs;

  _QuestionWidget(this.faqs);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(this.faqs.owner.image),
                backgroundColor: Colors.transparent,
                minRadius: 20,
                maxRadius: 30,
              ),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(this.faqs.title, style: TextStyle(
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("Score", style: TextStyle(color: Colors.grey),),
                            Row(
                              children: <Widget>[
                                Icon(Icons.score, color: Colors.grey,),
                                Text(faqs.score.toString(), style: TextStyle(color: Colors.grey),),
                              ],
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Column(
                          children: <Widget>[
                            Text("Answers", style: TextStyle(color: Colors.grey),),
                            Row(
                              children: <Widget>[
                                Icon(Icons.question_answer, color: Colors.grey,),
                                Text(faqs.answerCount.toString(), style: TextStyle(color: Colors.grey),),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                )),
            ],
          ),
        ),
      ),
      onTap: () => Navigator.push(context,
        MaterialPageRoute(builder: (context) => SearchDetail(faqs)),
      )
    );
  }
}
