[![Build Status](https://travis-ci.org/Tutuchan/chartjs.svg)](https://travis-ci.org/Tutuchan/chartjs)

# chartjs

This is an implementation of the [Chart.js](http://www.chartjs.org/) library in R using the [htmlwidgets](https://github.com/ramnathv/htmlwidgets) framework.


## Installation

```r
devtools::install_github("tutuchan/chartjs")
```

## Documentation

The Chart.js team has updated the documentation for v2.0 at [this adress](http://www.chartjs.org/docs/).

Some examples are available in the inst directory.

## Known bugs

+ Polar Area charts should be drawn when the page is first loaded, meaning they can't be inside tabs for example,
+ in flexdashboard documents, use the following options: `cjsOptions(responsive = FALSE, maintainAspectRatio = FALSE)` to ensure that the charts are correctly sized.
