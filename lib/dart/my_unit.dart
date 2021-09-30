import 'package:http/http.dart' as http;

class MyUnit {
  String returnHelloWorld() {
    return 'Hello World!';
  }

  static const String url = 'http://test.de/my/ressource#fragment?a=1';

  Future<String> fetchFromServer(http.Client httpClient) async {
    var res = await httpClient.get(Uri.parse(url));

    if(res.statusCode == 200) {
      return res.body;
    }
    throw Exception(res.statusCode);
  }
}