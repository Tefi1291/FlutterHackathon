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
        child: HtmlView(
          data: this.question.body,
          stylingOptions: null,
        ),
      ),
    );
  }
}