import 'dart:convert';
import 'dart:io';

import 'package:flutter_demo_project/dart/example_json_model.dart';

main() async {
  var jsonString = await File('lib/dart/in/example.json').readAsString();
  var json = jsonDecode(jsonString);
  var object = ExampleJsonModel.fromJson(json);

  print(object.firstName);

  var temp = object.toJson();
  temp['firstName'] = 'Bernd';
  object = ExampleJsonModel.fromJson(temp);

  var newJsonString = jsonEncode(object.toJson());

  print(newJsonString);
}