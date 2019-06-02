class Faqs {
  String title;
  String user;
  String questionId;


  Faqs.fromJson(Map json){
    this.title = json["title"];
    //this.questionId = json["question_id"];
  }
}