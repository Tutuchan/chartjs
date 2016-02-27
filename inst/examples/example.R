library(chartjs)

chartjs(mtcars, mpg, qsec, labels = row.names(mtcars)) %>%
  cjsBar %>%
  cjsTitle(title = "mtcars") %>%
  cjsLegend(position = "bottom", labels = list(boxWidth = 20, fontSize = 25))


chartjs(mtcars, mpg, qsec, labels = row.names(mtcars)) %>%
  cjsRadar

mt <- mtcars[1:6,]
chartjs(mt, mpg) %>%
  cjsPolar

chartjs(mtcars, mpg, qsec, labels = row.names(mtcars), chartOptions = list(hover = list(mode = "dataset"))) %>%
  cjsBar %>%
  cjsScale("x", scaleLabel = list(display = FALSE, fontStyle = "bold"), display = TRUE, gridLines = list(display = FALSE)) %>%
  cjsScale("y", ticks = list(beginAtZero = TRUE))