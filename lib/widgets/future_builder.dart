import 'package:flutter/material.dart';
import 'package:flutter_demo_project/dart/post_model.dart';

import '../dart/sending_web_requests.dart';
import 'helper_functions.dart';

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
