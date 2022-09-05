import 'dart:convert';
import 'dart:io';

class ApiClient {

  final client = HttpClient();

  Future<dynamic> getListOfData() async {
    final json = await get();
    return json;
  }

  Future<dynamic> get() async {
    final queryParameters = {
      'client_id': '896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043',
    };
    final uri = Uri.https(
        'api.unsplash.com', '/photos/' , queryParameters);
    final request = await client.getUrl(uri);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    print(jsonStrings.reversed);
    final jsonString = jsonStrings.join();
    final dynamic json = jsonDecode(jsonString);
    return json;
  }
}
