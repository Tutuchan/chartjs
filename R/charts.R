#' Draw charts
#'
#' These functions are used to draw the different types of graphs.
#'
#' For \code{colours}, the names of the list must be among those in \code{\link{colortypes}}.
#' The default colours are obtained from the \strong{Paired} palette from the
#' \code{\link[RColorBrewer]{RColorBrewer}} package.
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @name charts
#' @examples
#' data <- list(mpg = mtcars$mpg, qsec = mtcars$qsec)
#'
#' # Draw a bar chart
#' chartjs(data, labels = row.names(mtcars)) %>%
#'   cjsBar
#'
#' # Draw a stacked bar chart
#' chartjs(data, labels = row.names(mtcars)) %>%
#'   cjsBar(stacked = TRUE)
#'
#' # Draw a line chart
#' chartjs(data, labels = row.names(mtcars)) %>%
#'   cjsLine
#'
#' # Draw a radar chart
#' chartjs(data, labels = row.names(mtcars)) %>%
#'   cjsRadar
#'
#' # Draw a pie chart
#' chartjs(data = data$mpg[c(1:6)], labels = row.names(mtcars)[c(1:6)]) %>%
#'   cjsPie
#'
#' # Draw a doughnut chart
#' chartjs(data = data$mpg[c(1:6)], labels = row.names(mtcars)[c(1:6)]) %>%
#'   cjsDoughnut(cutout = 80)
#'
NULL

#' @rdname charts
#' @param stacked a logical, defaults to FALSE. If TRUE, bars will be stacked
#' at each x value.
#' @export
cjsBar <- function(chartjs, stacked = FALSE){
  chartjs$x$stacked <- stacked
  baseChart(chartjs, "bar")
}

#' @rdname charts
#' @export
cjsLine <- function(chartjs){
  baseChart(chartjs, "line")
}

#' @rdname charts
#' @export
cjsPie <- function(chartjs){
  baseChart(chartjs, "pie")
}


#' @rdname charts
#' @param cutout the optional percentage of the inner cutout for Doughnut
#' charts (defaults to 50)
#' @export
cjsDoughnut <- function(chartjs, cutout = 50){
  chartjs$x$options$cutoutPercentage <- cutout
  cjsPie(chartjs = chartjs)
}

#' @rdname charts
#' @export
cjsPolar <- function(chartjs){
  baseChart(chartjs, "polarArea")
}

#' @rdname charts
#' @export
cjsRadar <- function(chartjs){
  baseChart(chartjs, "radar")
}