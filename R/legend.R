#' Add legends
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param ... a list of additional parameters
#'
#'
#' @export

cjsLegend <- function(chartjs, ...){
  chartjs$x$options$legend <- c(list(display = TRUE), ...)
  chartjs
}