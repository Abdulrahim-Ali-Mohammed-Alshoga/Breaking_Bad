import 'package:breaking_bad/business_logic/cubit/actor_state.dart';
import 'package:breaking_bad/data/models/actors.dart';
import 'package:breaking_bad/data/repository/actors_hive_repository.dart';
import 'package:breaking_bad/data/repository/actors_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/widgets/toast_contact_widget.dart';

class ActorCubit extends Cubit<ActorState>{
  ActorCubit(this.actorRepository):super(ActorInitialState());
ActorRepository actorRepository;
   List<Actors> actors=[];
  void getAllActors() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      if (actors.isEmpty) {
actors=await ActorHiveRepository.getAllNewsHive();
if(actors.isEmpty) {
          emit(ActorLoading());
        }
else {
  emit(ActorSuccess());
}
      }
      else {
        emit(ActorSuccess());
      }
      try {
        actors = await actorRepository.getAllActors();
        emit(ActorSuccess());
        await ActorHiveRepository.putNewsHive(actors);
      } catch (e) {
        emit(ActorFailure());
      }
    }
    else{
      if(actors.isEmpty) {
        actors=await ActorHiveRepository.getAllNewsHive();
        if(actors.isEmpty) {
          emit(NotConnected());
        }
        else {
          emit(ActorSuccess());
          ToastContactWidget.checkInternetConnectivity();
        }}
      else{
        ToastContactWidget.checkInternetConnectivity();
      }
    }
  }
}