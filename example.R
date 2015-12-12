library(chartjs)

df <- list(mpg = mtcars$mpg)
chartjs(df, labels = row.names(mtcars)) %>%
  cjsBar

chartjs(data = c(10, 12, 20), labels = row.names(mtcars)[c(1:3)], title = "topkek") %>%
  cjsDoughnut(cutout = 80)