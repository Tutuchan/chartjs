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
#' # Draw a bar chart
#' chartjs(mtcars, mpg, qsec) %>%
#'   cjsBar
#'
#' # Draw a stacked bar chart
#' chartjs(mtcars, mpg, qsec) %>%
#'   cjsBar(stacked = TRUE)
#'
#' # Draw a line chart
#' chartjs(mtcars, mpg, qsec) %>%
#'   cjsLine
#'
#' # Draw a radar chart
#' chartjs(mtcars, mpg, qsec) %>%
#'   cjsRadar
#'
#' # Draw a pie chart
#' chartjs(mtcars[1:6,], mpg) %>%
#'   cjsPie
#'
#' # Draw a doughnut chart
#' chartjs(mtcars[1:6,], mpg) %>%
#'   cjsDoughnut(cutout = 80)
#'
#' # Draw a polar area chart
#' chartjs(mtcars[1:6,], mpg) %>%
#'   cjsPolar
#'
NULL

#' @rdname charts
#' @param stacked a logical, defaults to FALSE. If TRUE, bars will be stacked
#' at each x value.
#' @export
cjsBar <- function(chartjs, labels){
  cjs_base_chart(chartjs, labels, "bar") %>%
    cjsAddScale("x", "category") %>%
    cjsAddScale("y", "linear")
}

#' @rdname charts
#' @export
cjsLine <- function(chartjs, labels){
  cjs_base_chart(chartjs, labels, "line") %>%
    cjsAddScale("x", "category") %>%
    cjsAddScale("y", "linear")
}

#' @rdname charts
#' @export
cjsPie <- function(chartjs, labels){
  cjs_base_chart(chartjs, labels, "pie")
}

#' @rdname charts
#' @param cutout the optional percentage of the inner cutout for Doughnut
#' charts (defaults to 50)
#' @export
cjsDoughnut <- function(chartjs, labels, cutout = 50){
  chartjs$x$options$cutoutPercentage <- cutout
  cjs_base_chart(chartjs, labels, "pie")
}

#' @rdname charts
#' @export
cjsPolar <- function(chartjs, labels){
  cjs_base_chart(chartjs, labels, "polarArea") %>%
    cjsAddScale(NULL, "radialLinear")
}

#' @rdname charts
#' @export
cjsRadar <- function(chartjs, labels){
  cjs_base_chart(chartjs, labels, "radar") %>%
    cjsAddScale(NULL, "radialLinear")
}

cjs_base_chart <- function(chartjs, labels, type){
  class(chartjs) <- c(class(chartjs), paste0("cjs_", type))
  chartjs$x$type <- type
  chartjs$x$data$labels <- labels
  chartjs
}
