# Mobile Flutter Application

This repository contains the source code for the bachelor thesis [https://github.com/devrnt/bachelor-thesis](https://github.com/devrnt/bachelor-thesis)

## Information
This repository contains the following state management approaches:
* Scoped Model
* Provider
* BLoC with RxDart
* Redux
* MobX

The base code, containing widgets like a themed button and ainput field, can be found on the `master` branch. 
For every approach, listed above, is a branch created. Switch to the desired state management branch and run the Flutter application.

```
flutter run
```

## MobX
If any code for MobX is in need for change, run:
```
flutter packages pub run build_runner watch
```

## Demo
Product list        |  Product details
:-------------------------:|:-------------------------:
![Demo](demo/mock-home_screen.png)  | ![Demo dark theme](demo/mock-details_screen.png)

Add product        |  Preferences
:-------------------------:|:-------------------------:
![Demo](demo/mock-add_product_screen.png)  | ![Demo dark theme](demo/mock-preferences.png)

## Performance testing

Attach a real device and run the following command from the root of the repo:

```sh
flutter drive --target=test_driver/app.dart --profile
```

This will do an automated run-through of the app, and will save the output to files.

* Look into to `build/walkthrough-*.json` files for detailed summaries of each run.
* Look at `test_driver/perf_stats.tsv` to compare latest runs with historical data.
* Run `Rscript test_driver/generate-graphs.R` (R must be installed) to generate
  boxplots of the latest runs. This will show up as `test_driver/*.pdf` files.
* Peruse the raw data file (used by R to generate the boxplots) by opening the
  `durations.tsv` file. These files contain build and rasterization times for each frame
  for every run.

To execute several runs at once, run the following command:

```sh
DESC="my change" bash -c 'for i in {1..5}; do flutter drive --target=test_driver/app.dart --profile; sleep 1; done'
```

With several identical walkthroughs it's possible to visually check variance between runs. Even with box plots,
these nuances get lost in the summary stats, so it's hard to see whether a change actually
brought any performance improvement or not. Running several times also eliminates
the effect of extremely bad luck, like for example when Android decides to update some app while
test is running.