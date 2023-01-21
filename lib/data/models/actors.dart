class Actors {
  late String name;
  late int id;
  late String image;
  late String occupationDeadOrLive;
  late List<dynamic> numbersSeasonsAppeared;
  late String category;
  late String realNameActor;
  late List<dynamic> occupation;

  Actors(
      this.id,
      this.name,
      this.image,
      this.numbersSeasonsAppeared,
      this.occupation,
      this.occupationDeadOrLive,
      this.category,
      this.realNameActor);

  Actors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['char_id'];
    image = json['img'];
    category = json['category'];
    occupationDeadOrLive = json['status'];
    numbersSeasonsAppeared = json['appearance'];
    occupation = json['occupation'];
    realNameActor = json['portrayed'];
  }
}
