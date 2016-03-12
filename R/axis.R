#' @export
cjsAxis <- function(x, ...){
  UseMethod("cjsAxis")
}

#' @export
cjsAxis.cjs_bar <- function(cjs, labels){
  cjs$x$data$labels <- labels
  cjs
}

cjsAxis.cjs_line <- cjsAxis.cjs_bar
cjsAxis.cjs_radar <- cjsAxis.cjs_bar
cjsAxis.cjs_pie <- cjsAxis.cjs_bar
