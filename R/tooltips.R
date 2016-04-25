#' Edit default tooltips
#'
#' Allows editing of the default tooltips.
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param ... named arguments, see Details
#'
#' @details The allowed values in \code{...} can be found in the
#' \href{http://www.chartjs.org/docs/#getting-started-global-chart-configuration}{Chart.js documentation}
#' under \code{Charts.default.global.tooltips}.
#' @export
#' @name tooltips
cjsTooltips <- function(chartjs, ...){
  ldots <- list(...)
  chartjs$x$options$tooltips <- ldots
  chartjs
}