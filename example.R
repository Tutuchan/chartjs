library(chartjs)
library(magrittr)

labels <- LETTERS[1:10]
data <- list(y = round(runif(10),2), z= round(runif(10),2))

chartjs(data, labels) %>%
  lineChart %>%
  cjsTooltips(titleFontColor = "#0f0")

chartjs(data, labels) %>%
  barChart(stacked = TRUE)

chartjs(list(40, 60), labels = c("A", "B")) %>%
  doughnutChart

dataScatter <- list(y = matrix(round(runif(20),2), ncol = 2), z =matrix(round(runif(20),2), ncol = 2))
chartjs(dataScatter) %>%
  scatterChart