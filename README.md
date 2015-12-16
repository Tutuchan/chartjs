[![Build Status](https://travis-ci.org/Tutuchan/chartjs.svg)](https://travis-ci.org/Tutuchan/chartjs)

# chartjs

This is an implementation of the [Chart.js](http://www.chartjs.org/) library in R using the [htmlwidgets](https://github.com/ramnathv/htmlwidgets) framework.

WARNING : This work in progress is an implementation of the 2.0 version of Chart.js that is still under heavy development.
Things are subject to change.

## Installation

```r
devtools::install_github("tutuchan/chartjs", ref = "dev")
```

## Documentation

The Chart.js team has updated the documentation for v2.0 at [this adress](http://nnnick.github.io/Chart.js/docs-v2/), I'll include more documentation here when everything is stable.

## Differences from master branch and previous dev versions

 - removed support for title and legend in separate HTML containers as Chart.js will support them soon (?),
 - tooltips don't function properly,
 - color types have changed since Chart.js v1 (strokeColor -> borderColor),
 - changed the function template from <type>Chart to cjs<Type>,
 - colours are now a parameter of `chartjs` and no longer of the charting functions,
 - reworked the `chartjs` data declaration: it now takes a data.frame in the `data` arguments and the columns names in the `...` argument,
 - I haven't been able to code this properly yet so it relies on dplyr for the time being

```r
chartjs(mtcars, mpg, qsec) %>% 
  cjsBar
```