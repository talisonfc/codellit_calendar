import 'package:http/http.dart' as http;

class MockResponse extends http.Response {
  MockResponse(String body, int statusCode) : super(body, statusCode);
}

abstract class IApiClient<T> {
  Future<http.Response> get(Uri url,
      {Map<String, String>? headers, MockResponse? mockResponse});
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, dynamic body, MockResponse? mockResponse});
  Future<http.Response> put(Uri url,
      {Map<String, String>? headers, dynamic body, MockResponse? mockResponse});
  Future<http.Response> delete(Uri url,
      {Map<String, String>? headers, MockResponse? mockResponse});
}

class ApiClient implements IApiClient {
  final http.Client client = http.Client();
  late bool mockEnabled;

  ApiClient() {
    mockEnabled =
        const bool.fromEnvironment('MOCK_ENABLED', defaultValue: false);
  }

  @override
  Future<http.Response> delete(Uri url,
      {Map<String, String>? headers, MockResponse? mockResponse}) {
    return mockEnabled
        ? Future.value(mockResponse)
        : client.delete(url, headers: headers);
  }

  @override
  Future<http.Response> get(Uri url,
      {Map<String, String>? headers, MockResponse? mockResponse}) {
    return mockEnabled
        ? Future.value(mockResponse)
        : client.get(url, headers: headers);
  }

  @override
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, body, MockResponse? mockResponse}) {
    return mockEnabled
        ? Future.value(mockResponse)
        : client.post(url, headers: headers, body: body);
  }

  @override
  Future<http.Response> put(Uri url,
      {Map<String, String>? headers, body, MockResponse? mockResponse}) {
    return mockEnabled
        ? Future.value(mockResponse)
        : client.put(url, headers: headers, body: body);
  }
}
