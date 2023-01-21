import 'package:breaking_bad/data/models/actors.dart';
import 'package:breaking_bad/data/models/hive_models/actor_hive.dart';
import 'package:hive/hive.dart';
import '../../constants/hive_strings.dart';

class ActorHiveRepository {
static  Future putNewsHive(List<Actors> actors) async {
    var box = Hive.box<ActorsHive>(actorBD);
    ActorsHive actorHive;
    await box.clear();
    for (var actor in actors) {
      actorHive = ActorsHive(
          actor.name,
          actor.image,
          actor.realNameActor,
          actor.occupation,
          actor.category,
          actor.numbersSeasonsAppeared,
          actor.id,
          actor.occupationDeadOrLive);
      box.add(actorHive);
    }
  }
  static Future<List<Actors>> getAllNewsHive() async {
    var box = Hive.box<ActorsHive>(actorBD);
    if (box.toMap().values.toList() != []) {
      List<Actors> actors = box.values
          .map((actor) => Actors(
              actor.id,
              actor.name,
              actor.image,
              actor.numbersSeasonsAppeared,
              actor.occupation,
              actor.occupationDeadOrLive,
              actor.category,
              actor.realNameActor))
          .toList();
      return actors;
    } else {
      return [];
    }
  }
}
