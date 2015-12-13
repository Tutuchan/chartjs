library(chartjs)
library(magrittr)

shinyServer(function(input, output) {
  output$cjs <- renderChartjs({
    mainTitle <- "mpg"
    cjs <- if (input$chartType %in% c("bar", "line", "radar")){
      chartjs(list(mpg = mtcars$mpg), labels = row.names(mtcars))
    } else {
      chartjs(mtcars$mpg[1:6], labels = row.names(mtcars)[1:6])
    }
    # This is horrible code
    eval(expr = parse(text = paste0("cjs", Hmisc::capitalize(input$chartType), "(cjs)")))
  })
})