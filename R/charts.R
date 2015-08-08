#' Draw charts
#'
#' These functions are used to draw the different types of graphs.
#'
#' For \code{colours}, the names of the list must be among those in \code{\link{colortypes}}.
#' The base colours are obtained from the \strong{Paired} palette from the \code{\link[RColorBrewer]{RColorBrewer}} package.
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param colours an optional list of colours.
#' @param inner the optional percentage of the inner cutout for Pie and Doughnut charts (default 0 for Pie and 50 for Doughnuts)
#' @name charts
NULL

#' @rdname charts
#' @export
barChart <- function(chartjs, colours = NULL){
  chartjs <- baseChart(chartjs, "Bar", colours)
}

#' @rdname charts
#' @export
lineChart <- function(chartjs, colours = NULL){
  chartjs <- baseChart(chartjs, "Line", colours)
  chartjs
}

#' @rdname charts
#' @export
pieChart <- function(chartjs, colours = NULL, inner = 0){
  chartjs <- baseChart(chartjs, "Pie", colours)
  chartjs$x$inner <- inner
  chartjs
}

#' @rdname charts
#' @export
doughnutChart <- function(chartjs, colours = NULL, inner = 50){
  pieChart(chartjs, colours, inner)
}