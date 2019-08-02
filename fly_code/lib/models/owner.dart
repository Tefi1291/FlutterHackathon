class Owner {
  String name;
  int reputation;
  String image;

  Owner.fromJson(Map json){
    this.name = json["display_name"];
    this.reputation = json["reputation"];
    this.image = json["profile_image"];
  }
}