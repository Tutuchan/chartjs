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
chartjs <- function(data, ..., labels = NULL, dataLabels = NULL, width = NULL, height = NULL, chartOptions = NULL) {

  # Handle labels
  if (is.null(labels)){
    if (is.null(row.names(data))) row.names(data) <- paste0("row", 1:nrow(data))
    labels <- row.names(data)
  }
  # Select the correct columns
  data <- data %>%
    dplyr::select(...) %>%
    as.list

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
  chartOptions <- mergeLists(baseOptions(), chartOptions)

  # Forward data using x
  x = list(labels = labels,
           data = data,
           dataLabels = dataLabels,
           options = chartOptions,
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
  tags$div(class = "htmlwidget_container", tags$div(class = "chart-container", tags$canvas(id = id, class = class)))
}
