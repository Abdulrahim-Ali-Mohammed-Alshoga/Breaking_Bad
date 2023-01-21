import 'package:breaking_bad/data/models/actors.dart';
import 'package:breaking_bad/data/web_services/actors_web_service.dart';

class ActorRepository{
  ActorsWebService actorsWebService;
  ActorRepository(this.actorsWebService);
  Future<List<Actors>> getAllActors() async{
    final actors= await actorsWebService.getAllActors();
    return actors.map((actor) => Actors.fromJson(actor)).toList();
  }
}