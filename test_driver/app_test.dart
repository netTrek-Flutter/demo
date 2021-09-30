import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    late FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      driver.close();
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('increments the counter', () async {
      final timeline = await driver.traceAction(() async {
        // First, tap the button.
        await driver.tap(buttonFinder);

        // Then, verify the counter text is incremented by 1.
        expect(await driver.getText(counterTextFinder), "1");
      });
      TimelineSummary.summarize(timeline)
          .writeTimelineToFile('timing_report', pretty: true);
    });

    test('increments the counter during animation', () async {
      await driver.runUnsynchronized(() async {
        // First, tap the button.
        await driver.tap(buttonFinder);

        // Then, verify the counter text is incremented by 1.
        expect(await driver.getText(counterTextFinder), "1");
      });
    });
  });
}
