abstract class IHttpService {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, {dynamic data});
  Future<dynamic> put(String url, {dynamic data});
  Future<dynamic> patch(String url, {dynamic data});
  Future<dynamic> delete(String url, {dynamic data});
}
