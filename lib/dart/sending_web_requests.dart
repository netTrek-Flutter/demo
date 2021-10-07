import 'dart:convert';
import 'dart:io';

import 'post_model.dart';

const API_ENDPOINT = 'https://jsonplaceholder.typicode.com/';

main() async {
  var responseFuture = sendRequest();

  print((await responseFuture).toJson().toString());
}

Future<PostModel> sendRequest() async {
  var httpClient = HttpClient();

  var request =
      await httpClient.getUrl(Uri.parse(API_ENDPOINT).resolve('posts/1'));
  var response = await request.close();
  String responseBody = await response.transform(utf8.decoder).join();

  await Future.delayed(Duration(seconds: 2));

  return PostModel.fromJson(jsonDecode(responseBody));
}
