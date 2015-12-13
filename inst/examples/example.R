library(chartjs)

df <- list(mpg = mtcars$mpg, qsec = mtcars$qsec)
chartjs(df, labels = row.names(mtcars)) %>%
  cjsBar %>%
  cjsTooltips(titleFontSize = 20)


chartjs(df, labels = row.names(mtcars)) %>%
  cjsRadar

chartjs(data = df$mpg[c(1:6)], labels = row.names(mtcars)[c(1:6)]) %>%
  cjsDoughnut(cutout = 80)