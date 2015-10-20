library(chartjs)

shinyUI(fluidPage(

  titlePanel("Cars"),

  sidebarLayout(
    sidebarPanel(
      selectInput("chartType", label = "Chart Type",
                  choices = c("Bar", "Line"),
                  selected = "Bar")),
    mainPanel(
      chartjsOutput("cjs")
    )
  )
))