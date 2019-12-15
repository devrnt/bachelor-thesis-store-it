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
DESC="my change" bash -c 'for i in {1..30}; do flutter drive --target=test_driver/app.dart --profile; sleep 1; done'
```

With several identical walkthroughs it's possible to visually check variance between runs. Even with box plots,
these nuances get lost in the summary stats, so it's hard to see whether a change actually
brought any performance improvement or not. Running several times also eliminates
the effect of extremely bad luck, like for example when Android decides to update some app while
test is running.

### Graphs
To generate the graphs with the R-script, the different tsv files should be merged into one big tsv file. The tsv file should contain every approach looped 30 times, with the description set to the approach. To keep things simple, copy and paste `durations.tsv` and `perf_stats.tsv` to the next approach (branch). 

## Experiment Results
To get all the results from every approach run:
```sh
./get_all_results.sh [amount_of_runs]
```
The command defaults to 30 runs if no [amount_of_runs] is specified.
This command will execute the intergration tests [amount_of_runs] times for every approach
