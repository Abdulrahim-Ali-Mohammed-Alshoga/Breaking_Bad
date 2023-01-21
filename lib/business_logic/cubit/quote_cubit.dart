import 'package:breaking_bad/business_logic/cubit/quote_state.dart';
import 'package:breaking_bad/data/models/quote.dart';
import 'package:breaking_bad/data/repository/quotes_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteCubit extends Cubit<QuoteState>{
  QuoteCubit(this.quotesRepository):super(QuoteInitialState());
  QuotesRepository quotesRepository;
  List<Quote> quote=[];
  getQuotes(String nameActor) async{
    if (quote.isEmpty) {

      emit(QuoteLoading());}
    else {
      emit(QuoteSuccess());

    }

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        quote = await quotesRepository.getQuote(nameActor);
        print(quote);
        emit(QuoteSuccess());
        //await newsHiveRepository.putNewsHive(newAnime, "anime");
      } catch (e) {
        emit(QuoteFailure());
      }
    }
  }
}