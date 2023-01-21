import 'package:breaking_bad/constants/conction.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ActorsWebService {
  late Dio dio;

  ActorsWebService() {
    BaseOptions baseOptions = BaseOptions(
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
        baseUrl: Conction.baseeUrl,
        receiveDataWhenStatusError: true);
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getAllActors() async {
    try {
      Response response = await dio.get(
        "characters",
      );

      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }
}
