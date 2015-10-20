#' Draw charts
#'
#' These functions are used to draw the different types of graphs.
#'
#' For \code{colours}, the names of the list must be among those in \code{\link{colortypes}}.
#' The default colours are obtained from the \strong{Paired} palette from the
#' \code{\link[RColorBrewer]{RColorBrewer}} package.
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param colours an optional list of colours.
#' @name charts
#' @examples
#' labels <- row.names(mtcars)
#'
#' # Draw a bar chart
#' chartjs(mtcars, mpg, qsec, labels = labels) %>%
#'   barChart
#'
#' # Draw a stacked bar chart
#' chartjs(mtcars, mpg, qsec, labels = labels) %>%
#'   barChart(stacked = TRUE)
#'
#' # Draw a line chart
#' chartjs(mtcars, mpg, qsec, labels = labels) %>%
#'   lineChart
#'
#' # Draw a radar chart
#' chartjs(mtcars, mpg, qsec, labels = labels) %>%
#'   radarChart
#'
#' # Draw a pie chart
#' chartjs(mtcars[1,], mpg, qsec) %>%
#'   pieChart
#'
#' # Draw a doughnut chart
#' chartjs(mtcars[1,], mpg, qsec) %>%
#'   doughnutChart
#'
#' # Draw a scatter chart
#' chartjs(dataScatter) %>%
#'   scatterChart
NULL

#' @rdname charts
#' @param stacked a logical, defaults to FALSE. If TRUE, bars will be stacked
#' at each x value.
#' @export
barChart <- function(chartjs, colours = NULL, stacked = FALSE){
  chartjs <- baseChart(chartjs, "Bar", colours)
  chartjs$x$stacked = stacked
  chartjs
}

#' @rdname charts
#' @export
lineChart <- function(chartjs, colours = NULL){
  chartjs <- baseChart(chartjs, "Line", colours)
  chartjs
}

#' @rdname charts
#' @param inner the optional percentage of the inner cutout for Pie and Doughnut
#' charts (defaults to 0 for Pie and 50 for Doughnut)
#' @export
pieChart <- function(chartjs, colours = NULL, inner = 0){
  if (all(chartjs$x$labels == "")) chartjs$x$labels <- chartjs$x$dataLabels
  chartjs <- baseChart(chartjs, "Pie", colours)
  chartjs$x$options$cutoutPercentage <- inner
  chartjs
}

#' @rdname charts
#' @export
doughnutChart <- function(chartjs, colours = NULL, inner = 50){
  pieChart(chartjs, colours, inner)
}

#' @rdname charts
#' @export
radarChart <- function(chartjs, colours = NULL){
  chartjs <- baseChart(chartjs, "Radar", colours)
  chartjs
}

#' @rdname charts
#' @export
polarAreaChart <- function(chartjs, colours = NULL){
  chartjs <- baseChart(chartjs, "PolarArea", colours)
  chartjs
}

#' @rdname charts
#' @export
scatterChart <- function(chartjs, colours = NULL){
  chartjs <- baseChart(chartjs, "Scatter", colours)
  chartjs$x$data <- lapply(chartjs$x$data, function(mat) {
    apply(mat, 1, function(rw) list(x = rw[1], y = rw[2]))
  })
  chartjs
}