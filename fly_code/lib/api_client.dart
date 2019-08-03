import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:fly_code/models/faqs.dart';


final String baseUrl = 'https://api.stackexchange.com/2.2/search';
final String baseParams = 'site=stackoverflow&order=asc&sort=votes';

Future<List<Faqs>> getFaqs(String query) async{
  var faqs = <Faqs>[];
  String url = '$baseUrl/advanced?tagged=flutter&answers=1&$baseParams&q=$query&filter=withbody';
  final response = await http.get(url, headers: {'Accept': 'application/json'});
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