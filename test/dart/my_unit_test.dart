import 'package:flutter_demo_project/dart/my_unit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'my_unit_test.mocks.dart';

@GenerateMocks([http.Client])
main() {
  group('MyUnit', () {
    var myUnit = MyUnit();

    test('Hello World is returned', () {
      expect(myUnit.returnHelloWorld(), 'Hello World!');
    });

    group('fetchFromServer', () {
      test('valid request', () async {
        var mockClient = MockClient();
        when(mockClient.get(Uri.parse(MyUnit.url))).thenAnswer(
            (realInvocation) async =>
                http.Response('valid server response', 200));

        expect(
            await myUnit.fetchFromServer(mockClient), 'valid server response');
      });
      test('invalid request', () async {
        var mockClient = MockClient();
        when(mockClient.get(Uri.parse(MyUnit.url))).thenAnswer(
            (realInvocation) async =>
                http.Response('invalid server response', 500));

        expect(myUnit.fetchFromServer(mockClient), throwsException);
      });
    });
  });
}
