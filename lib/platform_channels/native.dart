import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

main() async {
  MethodChannel platform =
      MethodChannel('de.nettrek.flutter.demo.demo_flutter_project/battery');

  Stream<int> batteryLevels = checkBatteryLevelPeriodic(platform);

  buildInDefaultContainer(
    StreamBuilder<int>(
      stream: batteryLevels,
      builder: (context, snapshot) => Center(
        child: Text(snapshot.hasError ? 'An error occurred: ${snapshot.error} \n ${snapshot.stackTrace}' : snapshot.hasData? 'Battery status is ${snapshot.data}%' : 'No data available'),
      ),
    ),
  );
}

Stream<int> checkBatteryLevelPeriodic(MethodChannel methodChannel) async* {
  while(true) {
    yield await getBatteryLevel(methodChannel);
    await Future.delayed(Duration(seconds: 2));
  }
}

Future<int> getBatteryLevel(MethodChannel methodChannel) async {
  try {
    return await methodChannel.invokeMethod('getBatteryLevel');
  } on PlatformException catch (_) {
    return -1;
  }

}
