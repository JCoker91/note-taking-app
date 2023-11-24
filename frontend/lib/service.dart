import 'package:http/http.dart' as http;

class Service {
  static Future<http.Response> get(String path) async {
    // final Uri uri =
    //     Uri(host: 'api', port: 8000, path: 'api/$path', scheme: 'http');
    return http.get(Uri.parse('http://localhost:8000/api/$path/'));
  }
}
