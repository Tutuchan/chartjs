#' chartjs
#'
#' Draw a graph using the Chart.js library.
#'
#' See the documentation of Chart.js at \url{http://www.chartjs.org/docs}.
#'
#' @param data a named list or a vector of numerics, each element is a dataset to be plotted,
#' @param labels a vector of numerics or characters : the labels on the x-axis,
#' @param dataLabels a vector of characters : the names of the data series,
#' defaults to the names of \code{data}
#' @param width the width of the widget,
#' @param height the height of the widget,
#' @param chartOptions a list of options to customize the graph, see the Chart.js documentation.
#'
#' @import htmlwidgets
#' @import htmltools
#'
#' @export
chartjs <- function(data, labels = NULL, dataLabels = NULL, width = NULL, height = NULL, chartOptions = NULL) {

  len <- length(data)
  # Base colours allow for 6 datasets to be plotted
  if (len > 6 & (is.null(colours))) stop("too many datasets, provide 6 or less ")

  # Handle dataLabels
  if (is.null(dataLabels)){
    if (is.null(names(data))) names(data) <- paste0("var", 1:len) else {
      if (any(is.na(data))) names(data)[is.na(names(data))] <- paste0("var", 1:len)[is.na(names(data))]
    }
    dataLabels <- names(data)
  }

  #### Handle chartOptions
  baseOptions <- list(responsive = TRUE)
  chartOptions <- mergeLists(baseOptions, chartOptions)

  # forward data using x
  x = list(labels = labels,
           data = data,
           dataLabels = dataLabels,
           options = chartOptions,
           showLegend = FALSE)

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
