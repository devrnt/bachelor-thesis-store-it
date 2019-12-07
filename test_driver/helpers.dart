import 'dart:io';
import 'dart:math';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:git/git.dart';
import 'package:t_stats/t_stats.dart';

import 'parse_timeline.dart';

Future<void> fillAndSubmitForm(FlutterDriver driver) async {
  // Finders
  final titleInput = find.byValueKey('title_input');
  final descriptionInput = find.byValueKey('description_input');
  final priceInput = find.byValueKey('price_input');
  final imageUrlInput = find.byValueKey('image_url_input');
  final submitButton = find.text('Bevestig');

  const title = 'HP Envy 15';
  const description = 'HP Envy 15 description';
  const price = '150.45';
  const imageUrl =
      'https://www.electrocorner.be/media/catalog/product/cache/4/image/400x500/9df78eab33525d08d6e5fb8d27136e95/h/p/hp_envy_15-ae112nb-3.png';

  await driver.tap(titleInput);
  await driver.enterText(title);
  await driver.waitFor(find.text(title));

  await driver.tap(descriptionInput);
  await driver.enterText(description);
  await driver.waitFor(find.text(description));

  await driver.tap(priceInput);
  await driver.enterText(price);
  await driver.waitFor(find.text(price));

  await driver.tap(imageUrlInput);
  await driver.enterText(imageUrl);
  await driver.waitFor(find.text(imageUrl));

  await driver.tap(submitButton);
  await Future<void>.delayed(const Duration(seconds: 2));
}

Future<void> save(Timeline timeline) async {
  var description = Platform.environment['DESC'];

  if (description == null) {
    stderr.writeln('[WARNING] No description of the run through provided. '
        'You can do so via the \$DESC shell variable. '
        'For example, run the command like this: \n\n'
        '\$> DESC="run with foo" '
        'flutter drive --target=test_driver/performance.dart --profile\n');
    description = '';
  }

  var gitSha = '';
  if (await GitDir.isGitDir('.')) {
    var gitDir = await GitDir.fromExisting('.');
    var branch = await gitDir.currentBranch();
    gitSha = branch.sha.substring(0, 8);
  }

  var now = DateTime.now();
  var id = 'performance_test-${now.toIso8601String()}';
  var filename = id.replaceAll(':', '-');

  var summary = TimelineSummary.summarize(timeline);

  await summary.writeSummaryToFile(filename, pretty: true);
  await summary.writeTimelineToFile(filename);

  var rasterizerTimes =
      summary.summaryJson['frame_rasterizer_times'] as List<int>;
  var buildTimes = summary.summaryJson['frame_build_times'] as List<int>;
  var buildTimesStat = Statistic.from(
    buildTimes,
    name: id,
  );
  var additional = parse(timeline, summary);
  var frameRequestStats = Statistic.from(
      additional.frameRequestDurations.map((d) => d.inMicroseconds));

  IOSink stats;
  try {
    stats = File('test_driver/perf_stats.tsv').openWrite(mode: FileMode.append);
    // Add general build time statistics.
    stats.write(buildTimesStat.toTSV());
    // Add description.
    stats.write('\t');
    stats.write(description);
    // Add additional useful stats from the TimelineSummary.
    stats.write('\t');
    stats.write(summary.computePercentileFrameBuildTimeMillis(90));
    stats.write('\t');
    stats.write(summary.computePercentileFrameBuildTimeMillis(99));
    stats.write('\t');
    stats.write(summary.computeWorstFrameBuildTimeMillis());
    stats.write('\t');
    stats.write(summary.computeMissedFrameBuildBudgetCount());
    stats.write('\t');
    // Add things from parse_timeline.dart.
    stats.write(additional.length.inMicroseconds);
    stats.write('\t');
    stats.write(additional.frames);
    stats.write('\t');
    stats.write(additional.fps);
    stats.write('\t');
    stats.write(frameRequestStats.mean);
    stats.write('\t');
    stats.write(additional.dartPercentage);
    stats.write('\t');
    stats.write(additional.dartPhaseEvents);
    stats.write('\t');
    stats.write(additional.dartPhaseDuration.inMicroseconds);
    stats.write('\t');
    stats.write(additional.expiredTasksEvents);
    stats.write('\t');
    stats.write(additional.expiredTasksDuration.inMicroseconds);
    // Add timestamp.
    stats.write('\t');
    stats.write(now.toIso8601String());
    // End line.
    stats.writeln();
  } finally {
    await stats?.close();
  }

  IOSink durations;
  try {
    durations =
        File('test_driver/durations.tsv').openWrite(mode: FileMode.append);
    var length = [
      buildTimes.length,
      rasterizerTimes.length,
      additional.frameRequestDurations.length
    ].fold(0, max);
    for (int i = 0; i < length; i++) {
      var build = i < buildTimes.length ? buildTimes[i].toString() : '';
      var rasterizer =
          i < rasterizerTimes.length ? rasterizerTimes[i].toString() : '';
      var frameRequest = i < additional.frameRequestDurations.length
          ? additional.frameRequestDurations[i].inMicroseconds.toString()
          : '';
      var row = <String>[
        id,
        build,
        rasterizer,
        frameRequest,
        gitSha,
        description,
      ].join('\t');
      durations.writeln(row);
    }
  } finally {
    await durations?.close();
  }

  print(buildTimesStat);
}
