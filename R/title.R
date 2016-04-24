#' Add title
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param title the title of the chart
#' @param ... additional parameters
#'
#' @export

cjsTitle <- function(chartjs, title, ...){
  chartjs$x$options$title <- c(list(display = TRUE, text = title, ...))
  chartjs
}
