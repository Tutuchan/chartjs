library(chartjs)
library(magrittr)

shinyServer(function(input, output) {
  output$cjs <- renderChartjs({
    chartjs(data, labels, title = "mpg and qsec in the mtcars dataset") %>%
      chartjs:::baseChart(type = input$chartType) %>%
      cjsLegend(title = "Variables")
  })
})