# chartjs

This is an implementation of the [Chart.js](http://www.chartjs.org/) library in R.

# Installation

```r
devtools::install_github("tutuchan/chartjs")
```

# Example

```r
library(chartjs)
library(magrittr)

x <- LETTERS[1:10]
y <- list(y = round(runif(10),2), z= round(runif(10),2))
chartjs(x, y) %>%
  barChart
```