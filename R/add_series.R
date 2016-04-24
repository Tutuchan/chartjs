#' @export
cjsAddSeries <- function(x, ...){
  UseMethod("cjsAddSeries")
}

#' @export
cjsAddSeries.cjs_bar <- function(cjs, data, type = "bar", color = NULL, label = NULL, scale = NULL){
  n <- length(cjs$x$data$datasets)
  colours <- cjs %>% cjs_get_colours(color, n)
  dataset <- list(c(data = list(data), colours, label = label))
  if (!is.null(type)) dataset[[1]]$type <- type
  if (!is.null(scale)) dataset[[1]]$yAxisID <- paste0("y-axis-", scale - 1)
  cjs$x$data$datasets <- if (is.null(cjs$x$data$datasets)) dataset else c(cjs$x$data$datasets, dataset)
  cjs
}

#' @export
cjsAddSeries.cjs_line <- function(cjs, data, type = "line", color = NULL, label = NULL, scale = NULL){
  cjsAddSeries.cjs_bar(cjs, data, type, color, label, scale)
}

#' @export
cjsAddSeries.cjs_radar <- function(cjs, data, type = NULL, color = NULL, label = NULL, scale = NULL){
  cjsAddSeries.cjs_bar(cjs, data, type, color, label, scale)
}

#' @export
cjsAddSeries.cjs_pie <- function(cjs, data, color = NULL){
  n <- length(data)
  colours <- cjs %>% cjs_get_colours(color, n)
  dataset <- list(c(data = list(data), colours))
  cjs$x$data$datasets <- if (is.null(cjs$x$data$datasets)) dataset else c(cjs$x$data$datasets, dataset)
  cjs
}
#' @export
cjsAddSeries.cjs_polarArea <- cjsAddSeries.cjs_pie