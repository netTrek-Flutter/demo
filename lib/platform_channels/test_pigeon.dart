import 'package:flutter/material.dart';
import 'package:flutter_demo_project/platform_channels/pigeon.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

main() async {
  Stream<int> batteryLevels = checkBatteryLevelPeriodic();

  buildInDefaultContainer(
    StreamBuilder<int>(
      stream: batteryLevels,
      builder: (context, snapshot) => Center(
        child: Text(snapshot.hasError ? 'An error occurred: ${snapshot.error} \n ${snapshot.stackTrace}' : snapshot.hasData? 'Battery status is ${snapshot.data}%' : 'No data available'),
      ),
    ),
  );
}

Stream<int> checkBatteryLevelPeriodic() async* {
  while(true) {
    yield await BatteryApi().getBatteryLevel();
    await Future.delayed(Duration(seconds: 2));
  }
}
