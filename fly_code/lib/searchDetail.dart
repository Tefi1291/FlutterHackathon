import 'package:flutter/material.dart';

import 'package:flutter_html_view/flutter_html_view.dart';

import 'models/faqs.dart';

class SearchDetail extends StatelessWidget
{

  final Faqs question;
  ///Esta pagina va a mostrar detalles de una consulta en particular
  ///seleccionada en Search
  SearchDetail(this.question);


  IconData getVotesIcon() {
    if (this.question.score >= 0)
      return Icons.thumb_up;
    else
      return Icons.thumb_down;
  }

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
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Column(
                      children: <Widget>[
                        Text("Votes:"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(this.getVotesIcon(), size: 40,),
                            Text(this.question.score.toString(), style: TextStyle(
                              fontSize: 30
                            ),)
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(this.question.owner.image),
                              backgroundColor: Colors.transparent,
                              radius: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: <Widget>[
                                  Text(this.question.owner.name),
                                  Text("Reputation: ${this.question.owner.reputation}"),
                                ],
                              ),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(this.question.title),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              color: Colors.lightBlueAccent,
            ),
            Expanded(
              child: HtmlView(
                data: this.question.body,
                stylingOptions: null,
              ),
            ),
          ],
        )
    ),
    );
  }
}