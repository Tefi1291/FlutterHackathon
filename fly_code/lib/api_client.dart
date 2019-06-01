import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:fly_code/models/faqs.dart';

Future<List<Faqs>> getFaqs() async{
  var faqs = <Faqs>[];
  final response = await http.get('https://api.stackexchange.com/2.2/tags/flutter/faq?site=stackoverflow', headers: {"Accept": "application/json"});
  if(response.statusCode == 200) {
    var data = json.decode(response.body);
    for (var elem in data["items"]) {
      faqs.add(Faqs.fromJson(elem));
    }
    return faqs;
  } else {
    throw Exception('Failed to load data');
  }
}

Future<Faqs> getResponses() async{
  var faqs = <Faqs>[];
  final response = await http.get('https://api.stackexchange.com/2.2/tags/flutter/faq?site=stackoverflow', headers: {"Accept": "application/json"});
  if(response.statusCode == 200) {
    var data = json.decode(response.body);
    for (var elem in data["results"]) {
      faqs.add(Faqs.fromJson(elem));
    }
  } else {
    throw Exception('Failed to load data');
  }
}