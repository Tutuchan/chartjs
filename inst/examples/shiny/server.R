library(chartjs)
library(magrittr)

shinyServer(function(input, output) {
  output$cjs <- renderChartjs({
    mainTitle <- "mpg and qsec in the mtcars dataset"
    cjs <- if (input$chartType %in% c("Bar", "Line")){
      chartjs(mtcars, mpg, qsec, labels = row.names(mtcars), title = mainTitle)
    } else {
      chartjs(mtcars[1,], mpg, qsec, title = mainTitle)
    }
    # This is horrible code
    eval(expr = parse(text = paste0(tolower(input$chartType), "Chart(cjs)"))) %>%
      cjsLegend(title = "Variables")
  })
})