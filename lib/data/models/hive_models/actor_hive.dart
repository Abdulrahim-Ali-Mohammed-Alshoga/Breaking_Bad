import 'package:hive/hive.dart';
part 'actor_hive.g.dart';
@HiveType(typeId: 0)
class ActorsHive {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String image;
  @HiveField(2)
  late int id;
  @HiveField(3)
  late List<dynamic> numbersSeasonsAppeared;
  @HiveField(4)
  late String category;
  @HiveField(5)
  late String realNameActor;
  @HiveField(6)
  late List<dynamic> occupation;
  @HiveField(7)
  String occupationDeadOrLive;

  ActorsHive(
      this.name,
      this.image,
  this.realNameActor,
      this.occupation,
      this.category,
      this.numbersSeasonsAppeared,
      this.id,
      this.occupationDeadOrLive);

}
//flutter packages pub run build_runner build