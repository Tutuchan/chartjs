library(chartjs)

df <- list(mpg = mtcars$mpg, qsec = mtcars$qsec)
chartjs(mtcars, mpg, qsec, labels = row.names(mtcars)) %>%
  cjsBar %>%
  cjsTooltips(titleFontSize = 20)


chartjs(mtcars, mpg, qsec, labels = row.names(mtcars)) %>%
  cjsRadar

mt <- mtcars[1:6,]
chartjs(mt, hp, labels = row.names(mt)) %>%
  cjsPie
