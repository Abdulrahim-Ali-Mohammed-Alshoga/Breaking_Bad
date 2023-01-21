import 'package:breaking_bad/data/models/quote.dart';
import 'package:breaking_bad/data/web_services/quotes_web_service.dart';

class QuotesRepository {
      QuotesWebService quotesWebService;
      QuotesRepository(this.quotesWebService);
      Future<List<Quote>> getQuote(String nameActor) async{
        final quotes= await quotesWebService.getQuotes(nameActor);
        return quotes.map((quote) => Quote.formJson(quote)).toList();
      }
}