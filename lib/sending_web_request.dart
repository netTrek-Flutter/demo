import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

import 'dart/post_model.dart';

const API_ENDPOINT = 'https://jsonplaceholder.typicode.com/';

main() {
  var responseFuture = sendRequest();

  buildInDefaultContainer(
    FutureBuilder<PostModel>(
      future: responseFuture,
      builder: (context, snapshot) => snapshot.hasData
          ? Center(
              child: Text(
                '${snapshot.data!.id}: ${snapshot.data!.title}\n${snapshot.data!.body}',
                textAlign: TextAlign.center,
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    ),
  );
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
