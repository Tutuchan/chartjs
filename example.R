library(chartjs)
library(magrittr)
#
labels <- LETTERS[1:10]
data <- list(y = round(runif(10),2), z= round(runif(10),2))
chartjs(data, labels, chartOptions = list(borderWidth = 5)) %>%
  barChart

chartjs(list(40, 60), labels = c("A", "B")) %>%
  doughnutChart

# chartjs(data, labels) %>%
#   radarChart