#' chartjs
#'
#' Draw a graph using the Chart.js library.
#'
#' See the \href{http://nnnick.github.io/Chart.js/docs-v2/}{Chart.js documentation}.
#'
#' @param data a data.frame
#' @param ... the columns of \code{data} to plot
#' @param labels a vector of numerics or characters : the labels on the x-axis
#' @param dataLabels a vector of characters : the names of the data series
#' defaults to the names of \code{data}
#' @param width the width of the widget
#' @param height the height of the widget
#' @param chartOptions a list of options to customize the graph
#' see the \href{http://nnnick.github.io/Chart.js/docs-v2/}{Chart.js documentation}
#'
#' @import htmlwidgets
#' @import htmltools
#'
#' @export
chartjs <- function(chartOptions = NULL, width = NULL, height = NULL) {
  #### Handle chartOptions
  chartOptions <- mergeLists(baseOptions(), chartOptions)

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
