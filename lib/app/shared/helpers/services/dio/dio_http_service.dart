import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/services/http_service.dart';

class DioHttpService implements IHttpService {
  final Dio _dio;

  DioHttpService({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return _dio.get(url, queryParameters: queryParameters);
  }

  @override
  Future<Response> post(String url, {dynamic data}) async {
    return _dio.post(url, data: data);
  }

  @override
  Future<Response> put(String url, {dynamic data}) async {
    return _dio.put(url, data: data);
  }

  @override
  Future delete(String url, {dynamic data}) {
    return _dio.delete(url, data: data);
  }

  @override
  Future patch(String url, {dynamic data}) {
    return _dio.patch(url, data: data);
  }
}
