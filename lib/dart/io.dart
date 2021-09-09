import 'dart:convert';
import 'dart:io';

main() async {
  var file = File('test.txt')
    ..create()
    ..writeAsString(stdin.readLineSync() ?? '');

  var stream =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());

  stream.forEach((element) => print(element));
}
