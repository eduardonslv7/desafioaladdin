import 'package:dio/dio.dart';

class DioCreate {
  Dio configureDio() {
    final options = BaseOptions(
      baseUrl: "https://testedefensoriapr.pythonanywhere.com/",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );

    final dio = Dio(options);
    dio.options.followRedirects = true;

    return dio;
  }
}