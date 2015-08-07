library(chartjs)
library(magrittr)

# x <- LETTERS[1:10]
# y <- list(y = round(runif(10),2), z= round(runif(10),2))
# chartjs(x, y) %>%
#   barChart

x <- LETTERS[1:4]
y <- list(4,3,1,2)
chartjs(x, y) %>%
  doughnutChart
