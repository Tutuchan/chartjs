library(chartjs)

shinyUI(fluidPage(

  titlePanel("Cars"),

  sidebarLayout(
    sidebarPanel(
      selectInput("chartType", label = "Chart Type",
                  choices = c("bar", "line", "pie", "doughnut"),
                  selected = "bar")),
    mainPanel(
      chartjsOutput("cjs")
    )
  )
))