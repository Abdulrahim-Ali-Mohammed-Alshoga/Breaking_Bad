import 'package:breaking_bad/business_logic/cubit/actor_cubit.dart';
import 'package:breaking_bad/business_logic/cubit/quote_cubit.dart';
import 'package:breaking_bad/data/repository/actors_repository.dart';
import 'package:breaking_bad/data/repository/quotes_repository.dart';
import 'package:breaking_bad/data/web_services/actors_web_service.dart';
import 'package:breaking_bad/data/web_services/quotes_web_service.dart';
import 'package:breaking_bad/presentation/screens/actor_screen.dart';
import 'package:breaking_bad/presentation/screens/details_actor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/arguments.dart';
import 'constants/strings.dart';

class RouteApp {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case actorScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) =>
                    ActorCubit(ActorRepository(ActorsWebService()))..getAllActors(),
                child: ActorScreen()));
      case detailsActorScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (context) => QuoteCubit(QuotesRepository(QuotesWebService())),child: DetailsActorScreen(detailsActorArgument: settings.arguments as DetailsActorArgument)));
    }
  }
}
