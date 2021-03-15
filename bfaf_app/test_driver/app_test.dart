import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Testing App',
    () {
      FlutterDriver driver;

      setUpAll(
        () async {
          driver = await FlutterDriver.connect();
        },
      );

      tearDownAll(
        () async {
          if (driver != null) {
            await driver.close();
          }
        },
      );

      test(
        'Done module test',
        () async {
          final operationsTimeline = await driver.traceAction(() async {
            final keys = [
              'Modul 1 - Pengenalan Dart',
              'Modul 2 - Memulai Pemrograman dengan Dart',
              'Modul 3 - Dart Fundamental',
            ];

            for (var key in keys) {
              await driver.tap(find.byValueKey(key));
            }

            await driver.tap(find.byValueKey('done_page_button'));

            await driver.waitFor(find.text('Modul 1 - Pengenalan Dart'));
            await driver.waitFor(
                find.text('Modul 2 - Memulai Pemrograman dengan Dart'));
            await driver.waitFor(find.text('Modul 3 - Dart Fundamental'));
          });

          final operationsSummary =
              TimelineSummary.summarize(operationsTimeline);
          await operationsSummary.writeSummaryToFile('done_module',
              pretty: true);
          await operationsSummary.writeTimelineToFile('done_module',
              pretty: true);
        },
      );
    },
  );
}
