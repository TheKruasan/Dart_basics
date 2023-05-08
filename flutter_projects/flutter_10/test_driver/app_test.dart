import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:flutter/material.dart';

void main() {
  group('Enter test', () {
    FlutterDriver? driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) driver?.close();
    });

    final filedFoundLogin = find.byValueKey("EnterLogin");
    final filedFoundPassword = find.byValueKey("EnterPassword");
    final findSwichButton = find.text('Switch to registration form');

    test("Test email field", () async {
      await driver?.tap(findSwichButton);
      await driver?.tap(filedFoundLogin);
      await driver?.waitFor(find.text(""));
      await driver?.enterText("test@test.com");
      await driver?.waitFor(find.text("test@test.com"));
    });
  });
}
