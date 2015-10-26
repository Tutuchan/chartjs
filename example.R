library(chartjs)

chartjs(mtcars, mpg, qsec, labels = row.names(mtcars), title = "mpg and qsec in the mtcars dataset") %>%
  lineChart %>%
  cjsTooltips(mode = "label") %>%
  cjsLegend(title = "Variables")

chartjs(mtcars, mpg, qsec, labels = row.names(mtcars)) %>%
  barChart(stacked = TRUE)

chartjs(mtcars[1,], mpg, qsec, title = "is this title aligned with the chart ? looks like it !") %>%
  doughnutChart %>%
  cjsLegend(title = "Variables")

dataScatter <- list(y = matrix(round(runif(20),2), ncol = 2), z =matrix(round(runif(20),2), ncol = 2))
chartjs(mtcars, mpg, qsec) %>%
  scatterChart
