import 'package:breaking_bad/constants/conction.dart';
import 'package:dio/dio.dart';

class QuotesWebService{
  late Dio dio;
  QuotesWebService(){
    BaseOptions baseOptions=BaseOptions(
      baseUrl: Conction.baseeUrl,
      receiveTimeout: 20*1000,
      receiveDataWhenStatusError: true,
      connectTimeout: 20*1000
    );
    dio=Dio(baseOptions);
  }
  Future<List<dynamic>> getQuotes(String nameActor) async{
    try{
      Response response=await dio.get("quote",queryParameters: {'author':nameActor});
      return response.data;
    }
    catch(e){
      return [];
    }
   
  }
}