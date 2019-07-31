import 'owner.dart';

class Faqs {
  String title;
  Owner owner;
  String questionId;
  int answerCount;


  Faqs.fromJson(Map json){
    this.title = json["title"];
    this.answerCount = json["answer_count"];
    this.owner = Owner.fromJson(json["owner"]);
  }
}