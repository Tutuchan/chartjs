#' chartjs
#'
#' Draw a graph using the Chart.js library.
#'
#' @param width the width of the widget
#' @param height the height of the widget
#' @param palette either the name of a RColorBrewer palette or a list of custom colours as specified in \code{\link{colorTypes}}
#' @param debug if TRUE, prints information to the JS console
#'
#' @import htmlwidgets
#' @import htmltools
#'
#' @export
chartjs <- function(width = NULL, height = NULL, palette = "Paired", debug = FALSE) {
  chartOptions <- baseOptions()

  x = list(options = chartOptions,
           palette = palette,
           debug = debug)

  # Create widget
  htmlwidgets::createWidget(
    name = 'chartjs',
    x = x,
    width = width,
    height = height,
    package = 'chartjs'
  )
}

chartjs_html <- function(id, class, ...){
  # Inside a div to ensure flexdashboards sees the widget
  tags$div(id = paste0(id, "-container"), class = "htmlwidget_container", tags$canvas(id = id, class = class, ...))
}
