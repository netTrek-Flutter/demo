import 'dart:convert';
import 'dart:io';

main() async {
  var file = await File('lib/dart/out/test.txt').create(recursive: true);

  var ioSink = file.openWrite(mode: FileMode.append);

  ioSink.writeln((stdin.readLineSync() ?? '').replaceAll('e', ''));

  await ioSink.close();

  var stream =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());

  int lineNumber = 0;
  print('${file.absolute.path}:');
  await stream.forEach((line) => print('${++lineNumber}> $line'));
}
