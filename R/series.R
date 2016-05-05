#' Add a series to a chart
#'
#' Use this function to add a series to a chart.
#'
#' @param cjs a \code{\link{chartjs}} object
#' @param data a vector of data
#' @param type a character or NULL, the representation of the data,
#' @param color an optional list of colours, see \link{colortypes}
#' @param palette an optional RColorBrewer palette, defaults to Paired, see \code{\link[RColorBrewer]{display.brewer.all}}
#' @param label a character, the name of the series
#' @param scale an integer, the numeric position of the scale to attach the series to
#' @export
cjsSeries <- function(cjs, data, type, label, scale){
  UseMethod("cjsSeries")
}

#' @describeIn cjsSeries Add series to a bar chart
#' @keywords internal
#' @export
cjsSeries.cjs_bar <- function(cjs, data, type = "bar", label = NULL, scale = NULL){
  n <- length(cjs$x$data$datasets)
  colours <- cjs %>% cjs_get_colours(n)
  dataset <- list(c(data = list(data), colours, label = label))
  if (!is.null(type)) dataset[[1]]$type <- type
  if (!is.null(scale)) dataset[[1]]$yAxisID <- paste0("y-axis-", scale - 1)
  cjs$x$data$datasets <- if (is.null(cjs$x$data$datasets)) dataset else c(cjs$x$data$datasets, dataset)
  cjs
}

#' @describeIn cjsSeries Add series to a line chart
#' @keywords internal
#' @export
cjsSeries.cjs_line <- function(cjs, data, type = "line", label = NULL, scale = NULL){
  cjsSeries.cjs_bar(cjs, data, type, label, scale)
}

#' @describeIn cjsSeries Add series to a horizontal bar chart
#' @keywords internal
#' @export
cjsSeries.cjs_horizontalBar <- function(cjs, data, type = "horizontalBar", label = NULL, scale = NULL){
  cjsSeries.cjs_bar(cjs, data, type, label, scale)
}

#' @describeIn cjsSeries Add series to a radar chart
#' @keywords internal
#' @export
cjsSeries.cjs_radar <- function(cjs, data, type = NULL, label = NULL, scale = NULL){
  cjsSeries.cjs_bar(cjs, data, type, label, scale)
}

#' @describeIn cjsSeries Add series to a pie chart
#' @keywords internal
#' @keywords internal
#' @export
cjsSeries.cjs_pie <- function(cjs, data, type = NULL, label = NULL, scale = NULL){
  n <- length(data)
  colours <- cjs %>% cjs_get_colours(n)
  dataset <- list(c(data = list(data), colours))
  cjs$x$data$datasets <- if (is.null(cjs$x$data$datasets)) dataset else c(cjs$x$data$datasets, dataset)
  cjs
}

#' @describeIn cjsSeries Add series to a polarArea chart
#' @keywords internal
#' @export
cjsSeries.cjs_polarArea <- cjsSeries.cjs_pie