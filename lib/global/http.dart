import 'package:http/http.dart' as http;

class HttpClient {
  final String baseUrl = 'http://20.204.8.34:8084/index.php/api';

  Future<http.Response> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    return response;
  }
}
