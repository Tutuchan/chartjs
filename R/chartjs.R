#' chartjs
#'
#' Draw a graph using the Chart.js library
#'
#' See the documentation of Chart.js at \url{http://www.chartjs.org/docs}.
#'
#' @param x a vector of numerics or characters : the labels on the x-axis
#' @param y a named list of the y-axis data
#' @param width the width of the widget
#' @param height the height of the widget
#' @param type a character : the type of the widget, currently supports \code{line} or \code{bar}.
#' @param chartOptions a list of chartOptions to customize the graph
#'
#'
#'
#' @import htmlwidgets
#' @import htmltools
#'
#' @export
chartjs <- function(x, y, width = NULL, height = NULL, type = "line", chartOptions = NULL) {

  # Get y data
  listY <- y
  lY <- length(listY)
  if (lY > 6) stop("Too many series. Please plot 6 or less.")

  # Handle names
  if (is.null(names(y))) names(y) <- paste0("var", 1:lY) else {
    if (any(is.na(y))) names(y)[is.na(names(y))] <- paste0("var", 1:lY)[is.na(names(y))]
  }
  labels <- names(y)

  #### Handle chartOptions
  if(is.null(chartOptions)){
    chartOptions <- list()
  }

  # forward chartOptions using x
  x = list(x = x,
           y = unname(listY),
           labels = labels)

  # create widget
  htmlwidgets::createWidget(
    name = 'chartjs',
    x = x,
    width = width,
    height = height,
    package = 'chartjs'
  )
}

#' @export
chartjs_html <- function(id, style, class, ...){
  tags$div(class = "chart-container", tags$canvas(id = id, class = class))
}

#' Widget output function for use in Shiny
#'
#' @export
chartjsOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'chartjs', width, height, package = 'chartjs')
}

#' Widget render function for use in Shiny
#'
#' @export
renderChartjs <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, chartjsOutput, env, quoted = TRUE)
}
