import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../test_config.dart';

class DioService {
  final Dio _dio = Dio();

  DioService({required TestConfig testConfig}) {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${testConfig.TOKEN}',
    };
  }

  // Send GET request
  Future<Response> get(String url) async {
    try {
      return await _dio.get(url);
    } on DioException {
      rethrow;
    }
  }

  // Send POST request
  Future<Response> post(String url, Map<String, dynamic> body) async {
    try {
      return await _dio.post(url, data: jsonEncode(body));
    } on DioException {
      rethrow;
    }
  }
}
