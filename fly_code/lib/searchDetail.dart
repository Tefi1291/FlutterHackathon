import 'package:flutter/material.dart';

import 'package:flutter_html_view/flutter_html_view.dart';

import 'models/faqs.dart';

class SearchDetail extends StatelessWidget
{

  final Faqs question;
  ///Esta pagina va a mostrar detalles de una consulta en particular
  ///seleccionada en Search
  SearchDetail(this.question);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FlyCode"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(this.question.owner.image),
                        backgroundColor: Colors.transparent,
                        radius: 20,
                      ),
                      Container(
                        width: 100,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: <Widget>[
                            Text("Votes:"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.thumb_up),
                                Text(this.question.score.toString())
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[
                              Text(this.question.owner.name),
                              Text("Reputation: ${this.question.owner.reputation}"),
                            ],
                          ),
                        )
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(this.question.title),
                  ),
                ],
              ),
              color: Colors.lightBlueAccent,
            ),
            Expanded(
              child: HtmlView(
                data: this.question.body,
                stylingOptions: null,
              ),
            )
          ],
        )
    ),
    );
  }
}