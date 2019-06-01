import 'package:flutter/material.dart';

class SearchDetail extends StatelessWidget
{

  String questionId;
  ///Esta pagina va a mostrar detalles de una consulta en particular
  ///seleccionada en Search
  SearchDetail(this.questionId);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FlyCode"),
      ),
      body: Container(
        child: Text("responses"),
      ),
    );
  }
}