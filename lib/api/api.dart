import 'package:dio/dio.dart';

class Api {
  Api._internal();
  static final Api _singleton = Api._internal();
  factory Api() => _singleton;
  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 40),
      receiveTimeout: const Duration(seconds: 40),
      sendTimeout: const Duration(seconds: 40),
    ),
  );

  Future<Response> get(Uri uri) async => _dio.getUri(uri);
}
