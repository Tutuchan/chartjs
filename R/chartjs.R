#' chartjs
#'
#' Draw a graph using the Chart.js library
#'
#' See the documentation of Chart.js at \url{http://www.chartjs.org/docs}.
#'
#' @param data a named list of the y-axis data
#' @param labels a vector of numerics or characters : the labels of the data points.
#' Not needed for Pie, Doughnut and PolarArea charts.
#' @param width the width of the widget
#' @param height the height of the widget
#' @param chartOptions a list of chartOptions to customize the graph
#'
#' @import htmlwidgets
#' @import htmltools
#'
#' @export
chartjs <- function(data, labels = NULL, title = NULL, width = NULL, height = NULL, chartOptions = NULL) {

  # Get data
  len <- length(data)
  if (len > 6) stop("Too many series. Please plot 6 or less.")

  # Handle dataLabels
  if (is.null(names(data))) names(data) <- paste0("var", 1:len) else {
    if (any(is.na(data))) names(data)[is.na(names(data))] <- paste0("var", 1:len)[is.na(names(data))]
  }
  dataLabels <- names(data)

  # Handle labels
  if (is.null(labels)){
    # Find out the longest series in data
    labels <- rep("", max(sapply(data, length)))
  }

  #### Handle chartOptions
  baseOptions <- list(responsive = TRUE)
  if(is.null(chartOptions)){
    chartOptions <- baseOptions
  } else {
    commonNames <-  names(baseOptions) %in% names(chartOptions)
    chartOptions <- c(chartOptions, baseOptions[!commonNames])
  }

  # forward data using x
  x = list(labels = labels,
           data = unname(data),
           dataLabels = dataLabels,
           options = chartOptions,
           enableLegend = FALSE)

  x$title <- if (!is.null(title)) title else "Title"

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
  tags$div(class = "htmlwidget_container", tags$div(class = "chart-container", tags$canvas(id = id, class = class)))
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
