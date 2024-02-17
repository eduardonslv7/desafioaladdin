import 'dart:async';

import 'package:dio/dio.dart';
import 'package:projeto_aladdin/model/tapete.dart';
import 'package:projeto_aladdin/service/dio.dart';

class TapeteService {
  final Dio dio = DioCreate().configureDio();

  Future<List<Tapete>> getTapetes() async {
    final result = await dio.get("precos");
    try {
      final list = (result.data as List).map((e) => Tapete.fromJson(e)).toList();

      return list;
    } catch (e) {
      return [];
    }
  }
}
