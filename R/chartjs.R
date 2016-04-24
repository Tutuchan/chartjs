#' chartjs
#'
#' Draw a graph using the Chart.js library.
#'
#' @param width the width of the widget
#' @param height the height of the widget
#'
#' @import htmlwidgets
#' @import htmltools
#'
#' @export
chartjs <- function(width = NULL, height = NULL) {
  chartOptions <- baseOptions()

  x = list(options = chartOptions,
           showLegend = FALSE)

  # Create widget
  htmlwidgets::createWidget(
    name = 'chartjs',
    x = x,
    width = width,
    height = height,
    sizingPolicy = htmlwidgets::sizingPolicy(browser.fill = TRUE),
    package = 'chartjs'
  )
}

chartjs_html <- function(id, class, ...){
  tags$div(class = "htmlwidget_container", tags$div(class = "chart-container", tags$canvas(id = id, class = class, ...)))
}
