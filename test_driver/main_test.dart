import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flutter Driver demo', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      await driver?.close();
    });

    test('show presentation', () async {
      await driver.tap(find.text('True Code Reuse'));
      final page = find.byValueKey('presentation');
      var index = 0;
      while (index < 40) {
        await driver.tap(page);
        await Future<void>.delayed(const Duration(milliseconds: 800));
        index += 1;
      }
    }, timeout: Timeout.factor(10));
  });
}
