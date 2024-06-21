import '../model/http_client_response.dart';

typedef ProgressCallback = void Function(int count, int total);

abstract class IHttpClient {
  Future<HttpClientResponse> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
  Future<HttpClientResponse> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
  Future<HttpClientResponse> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
  Future<HttpClientResponse> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}
