class Owner {
  String name;
  int reputation;

  Owner.fromJson(Map json){
    this.name = json["display_name"];
    this.reputation = json["reputation"];
  }
}