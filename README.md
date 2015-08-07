# chartjs

This is an implementation of the [Chart.js](http://www.chartjs.org/) library in R using the [htmlwidgets](https://github.com/ramnathv/htmlwidgets) framework.

## Installation

```r
devtools::install_github("tutuchan/chartjs")
```

## Examples

### Bar and line charts

```r
library(chartjs)
library(magrittr)

x <- LETTERS[1:10]
y <- list(y = round(runif(10),2), z= round(runif(10),2))

chartjs(x, y) %>%
  barChart
  
chartjs(x, y) %>%
  lineChart
```

### Pie and doughnut charts

```r
x <- LETTERS[1:4]
y <- list(4,3,1,2)

chartjs(x, y) %>%
  pieChart

chartjs(x, y) %>%
  doughnutChart
```

Note that a `doughnutChart` is a `pieChart` with `inner` set to 50.