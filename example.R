library(chartjs)

# df <- list(mpg = mtcars$mpg, qsec = mtcars$qsec)
# chartjs(df, labels = row.names(mtcars)) %>%
#   cjsLine

chartjs(data = list(a = c(10, 12), b = c(10, 11), c = c(20, 21)), labels = row.names(mtcars)[c(1:2)]) %>%
  cjsPie