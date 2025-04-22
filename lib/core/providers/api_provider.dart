import 'package:http/http.dart' as http;

class APIService {
  Future<http.Response> fetchQuote() {
    return http.get(Uri.parse('https://thequoteshub.com/api/'));
  }
}
