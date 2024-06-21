import 'package:dio/dio.dart' hide ProgressCallback;
import 'package:flutter_clean_architecture_template/app/shared/helpers/environments/environment_config.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/network/interceptors/dio_auth_interceptor.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/network/http_clients/http_client.dart';
import 'package:flutter_clean_architecture_template/app/shared/helpers/network/model/http_client_error.dart';
import '../model/http_client_request_params.dart';
import '../model/http_client_response.dart';
import '../model/http_request_methods_enum.dart';

class DioHttpClient extends IHttpClient {
  final String baseApiUrl;
  final List<Interceptor> interceptors;
  late final Dio _dio;
  DioHttpClient({
    this.baseApiUrl = EnvironmentConfig.MSS_BASE_URL,
    Map<String, dynamic> headers = const {},
    this.interceptors = const [],
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseApiUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );
    _dio.options.headers.addAll(headers);

    _dio.interceptors.addAll([
      ...interceptors,
      AuthInterceptor(),
    ]);
  }

  Future<HttpClientResponse> request(HttpClientRequestParams params) async {
    try {
      final response = await _dio.request(
        params.endPoint,
        data: params.body,
        queryParameters: params.queryParams,
        options: Options(method: params.method.name, headers: params.headers),
        onReceiveProgress: params.onReceiveProgress,
        onSendProgress: params.onSendProgress,
      );

      return HttpClientResponse(
        data: response.data,
        statusCode: response.statusCode ?? 0,
      );
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.receiveTimeout) {
        throw TimeOutError(error.message, stackTrace: error.stackTrace);
      }
      throw HttpClientError(error.message, stackTrace: error.stackTrace);
    }
  }

  @override
  Future<HttpClientResponse> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return request(
      HttpClientRequestParams(
        endPoint: path,
        method: HttpRequestMethodsEnum.get,
        body: data,
        queryParams: queryParameters,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      ),
    );
  }

  @override
  Future<HttpClientResponse> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return request(
      HttpClientRequestParams(
        endPoint: path,
        method: HttpRequestMethodsEnum.post,
        body: data,
        queryParams: queryParameters,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      ),
    );
  }

  @override
  Future<HttpClientResponse> delete(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    return request(
      HttpClientRequestParams(
        endPoint: path,
        method: HttpRequestMethodsEnum.delete,
        body: data,
        queryParams: queryParameters,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      ),
    );
  }

  @override
  Future<HttpClientResponse> put(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    return request(
      HttpClientRequestParams(
        endPoint: path,
        method: HttpRequestMethodsEnum.put,
        body: data,
        queryParams: queryParameters,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      ),
    );
  }
}
