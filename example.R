library(chartjs)

chartjs(mtcars, mpg, qsec, labels = row.names(mtcars), title = "mpg and qsec in the mtcars dataset") %>%
  barChart %>%
  cjsTooltips(titleFontColor = "#4F92C4", fontFamily = "Calibri, Candara, Segoe, 'Segoe UI', Optima, Arial, sans-serif",
              titleFontFamily = "Calibri, Candara, Segoe, 'Segoe UI', Optima, Arial, sans-serif",
              cornerRadius = 0) %>%
  cjsLegend(title = "Variables")

chartjs(mtcars, mpg, qsec, labels = row.names(mtcars)) %>%
  barChart(stacked = TRUE)

chartjs(mtcars[1,], mpg, qsec, title = "is this title aligned with the chart ? looks like it !") %>%
  doughnutChart %>%
  cjsLegend(title = "Variables")

dataScatter <- list(y = matrix(round(runif(20),2), ncol = 2), z =matrix(round(runif(20),2), ncol = 2))
chartjs(mtcars, mpg, qsec) %>%
  scatterChart