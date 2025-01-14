import 'package:dio/dio.dart';

abstract class ApiClient{
  final Dio _dio = Dio();

  ApiClient() {
    _dio.options.headers['content-type'] = 'application/json';
    // _dio.options.baseUrl = 'https://voucher.crabytech.com/api/';
    _dio.options.baseUrl = 'http://54.243.8.93:8000/api/';
  }

  Dio get dio => _dio;
}
