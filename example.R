library(chartjs)

df <- list(mpg = mtcars$mpg, qsec = mtcars$qsec)
chartjs(df, labels = row.names(mtcars)) %>%
  cjsBar