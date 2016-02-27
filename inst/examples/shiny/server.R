library(chartjs)
library(magrittr)

shinyServer(function(input, output) {
  output$cjs <- renderChartjs({
    mainTitle <- "mpg"
    cjs <- if (input$chartType %in% c("bar", "line", "radar")){
      chartjs(mtcars, mpg, qsec, labels = row.names(mtcars))
    } else {
      chartjs(mtcars[1:6,], mpg, qsec, labels = row.names(mtcars))
    }
    # This is horrible code
    eval(expr = parse(text = paste0("cjs", Hmisc::capitalize(input$chartType), "(cjs)")))
  })
})