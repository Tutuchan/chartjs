library(chartjs)
library(magrittr)

x <- LETTERS[1:10]
y <- list(y = round(runif(10),2), z= round(runif(10),2))
chartjs(x, y) %>%
  barChart

