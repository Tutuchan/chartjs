#' chartjs
#'
#' Draw a graph using the Chart.js library. \code{chartjs} uses NSE to draw specific columns from a data.frame
#' while \code{chartjs_} draws all columns from a data.frame.
#'
#' See the documentation of Chart.js at \url{http://www.chartjs.org/docs}.
#'
#' @param dataframe a dataframe,
#' @param ... unquoted names of the columns to plot,
#' @param data a dataframe;
#' @param labels a vector of numerics or characters : the labels on the x-axis.
#' Not needed for Pie, Doughnut and PolarArea charts,
#' @param dataLabels a vector of characters : the names of the data series,
#' @param title the title of the chart,
#' @param width the width of the widget,
#' @param height the height of the widget,
#' @param chartOptions a list of options to customize the graph, see the Chart.js documentation.
#'
#' @import htmlwidgets
#' @import htmltools
#'
#' @name chartjs
#' @export

chartjs <- function(data, ..., labels = NULL, dataLabels = NULL, title = NULL, width = NULL, height = NULL, chartOptions = NULL){
  ldots <- lazyeval::lazy_dots(...)
  data <- data %>%
    dplyr::select_(.dots = ldots)
  chartjs:::chartjs_(data = data,
           labels, dataLabels, title, width, height, chartOptions)
}

#' @rdname chartjs
#' @export
chartjs_ <- function(data, labels = NULL, dataLabels = NULL, title = NULL, width = NULL, height = NULL, chartOptions = NULL) {

  # Get data
  len <- ncol(data)

  # Handle dataLabels
  if (is.null(dataLabels)){
    if (is.null(names(data))) names(data) <- paste0("var", 1:len) else {
      if (any(is.na(data))) names(data)[is.na(names(data))] <- paste0("var", 1:len)[is.na(names(data))]
    }
    dataLabels <- names(data)
  }


  # Handle labels
  if (is.null(labels)){
    # Find out the longest series in data
    labels <- rep("", max(sapply(data, length)))
  }

  #### Handle chartOptions
  baseOptions <- list(responsive = TRUE)
  chartOptions <- mergeLists(baseOptions, chartOptions)

  # forward data using x
  x = list(labels = labels,
           data = unname(data),
           dataLabels = dataLabels,
           options = chartOptions,
           showLegend = FALSE)

  x$title <- if (!is.null(title)) title else "Title"

  # create widget
  htmlwidgets::createWidget(
    name = 'chartjs',
    x = x,
    width = width,
    height = height,
    sizingPolicy = htmlwidgets::sizingPolicy(browser.fill = TRUE),
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
