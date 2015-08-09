library(chartjs)
library(magrittr)
#
labels <- LETTERS[1:10]
data <- list(y = round(runif(10),2), z= round(runif(10),2))
chartjs(data, labels) %>%
  lineChart
