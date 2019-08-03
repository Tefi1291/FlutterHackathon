import 'owner.dart';

class Faqs {
  int questionId;
  String title;
  Owner owner;
  int answerCount;
  int score;
  String body;


  Faqs.fromJson(Map json){
    this.questionId = json["question_id"];
    this.title = json["title"];
    this.owner = Owner.fromJson(json["owner"]);
    this.answerCount = json["answer_count"];
    this.score = json["score"];
    this.body = json["body"];
  }
}