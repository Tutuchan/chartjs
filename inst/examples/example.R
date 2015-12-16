library(chartjs)

chartjs(mtcars, mpg, qsec, labels = row.names(mtcars)) %>%
  cjsBar %>%
  cjsTooltips(titleFontSize = 20)


chartjs(mtcars, mpg, qsec, labels = row.names(mtcars)) %>%
  cjsRadar

mt <- mtcars[1:6,]
chartjs(mt, mpg) %>%
  cjsPolar
