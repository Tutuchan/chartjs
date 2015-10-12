library(chartjs)
library(magrittr)
#
labels <- LETTERS[1:10]
data <- list(y = round(runif(10),2), z= round(runif(10),2))
# chartjs(data, labels) %>%
#   barChart

chartjs(list(40,60,10), labels = c("A", "B", "C")) %>%
  pieChart

# chartjs(data, labels) %>%
#   radarChart