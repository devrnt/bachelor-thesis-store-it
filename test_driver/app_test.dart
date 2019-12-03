import 'package:flutter_driver/flutter_driver.dart';

import 'helpers.dart';

Future<void> main() async {
  FlutterDriver driver;

  try {
    driver = await FlutterDriver.connect();
    final timeline = await _run(driver);
    await save(timeline);
  } finally {
    if (driver != null) {
      await driver.close();
    }
  }
}

Future<Timeline> _run(FlutterDriver driver) async {
  final health = await driver.checkHealth();

  if (health.status != HealthStatus.ok) {
    throw StateError('FlutterDriver health: $health');
  } else {
    print('Flutter driver health status: ${health.status}');
  }

  await driver.startTracing();
  await _executeAppFlow(driver);
  return driver.stopTracingAndDownloadTimeline();
}

Future<void> _executeAppFlow(FlutterDriver driver) async {
  // Bottom navigation bar
  final homeScreenTab = find.byTooltip('home_tab');
  final addScreenTab = find.byTooltip('add_product_tab');
  final preferencesScreenTab = find.byTooltip('preferences_tab');

  // Common widgets
  final deleteButton = find.text('Verwijder');
  final themeSwitch = find.byValueKey('theme_switch');

  // List and items
  final productList = find.byValueKey('product_list');
  final productItem = find.byValueKey('product_item_2');
  // later used in flow
  final newProduct = find.byValueKey('product_item_2');

  // ===========
  // STARTS FLOW
  // ===========
  await driver.scrollUntilVisible(
    productList,
    productItem,
    dyScroll: -300.0,
  );

  // Open details screen
  await driver.tap(productItem);

  // Delete product
  await driver.tap(deleteButton);
  // Give UI 3 seconds time to pop the page
  await Future<void>.delayed(const Duration(seconds: 2));

  // Open add product screen
  await driver.tap(addScreenTab);

  // Fill in form
  await fillAndSubmitForm(driver);
  await Future<void>.delayed(const Duration(seconds: 1));

  await driver.tap(homeScreenTab);

  // Opens details screen
  await driver.tap(newProduct);

  // Delete product
  await driver.tap(deleteButton);
  // Give UI 3 seconds time to pop the page
  await Future<void>.delayed(const Duration(seconds: 2));

  // Open preferences screen
  await driver.tap(preferencesScreenTab);

  // Switch to black theme
  await driver.tap(themeSwitch);

  await driver.tap(homeScreenTab);

  final firstInList = find.byValueKey('product_item_1');
  // Delete product
  await driver.tap(firstInList);
  await driver.tap(deleteButton);
  // Give UI 3 seconds time to pop the page
  await Future<void>.delayed(const Duration(seconds: 3));

  // Open add product screen
  await driver.tap(addScreenTab);

  // Fill in form
  await fillAndSubmitForm(driver);

  // ===========
  // END FLOW
  // ===========
  await driver.tap(homeScreenTab);
}
