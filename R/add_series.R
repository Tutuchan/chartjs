#' @export
cjsAddSeries <- function(x, ...){
  UseMethod("cjsAddSeries")
}

#' @export
cjsAddSeries.cjs_bar <- function(cjs, data, color = NULL, label = NULL){
  l <- length(cjs$x$data$datasets)
  colours <- getColours(cjs$x$type, color, l)
  dataset <- list(c(data = list(data), colours, label = label))
  cjs$x$data$datasets <- if (is.null(cjs$x$data$datasets)) dataset else c(cjs$x$data$datasets, dataset)
  cjs
}

#' @export
cjsAddSeries.cjs_line <- cjsAddSeries.cjs_bar

#' @export
cjsAddSeries.cjs_radar <- cjsAddSeries.cjs_bar

#' @export
cjsAddSeries.cjs_pie <- function(cjs, data, color = NULL){
  l <- length(data)
  colours <- getColours(cjs$x$type, color, l)
  dataset <- list(c(data = list(data), colours))
  cjs$x$data$datasets <- if (is.null(cjs$x$data$datasets)) dataset else c(cjs$x$data$datasets, dataset)
  cjs
}