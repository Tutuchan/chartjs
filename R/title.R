#' Add title
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param text a character
#'
#' @export

cjsTitle <- function(chartjs, text){
  chartjs$x$options$title <- list(display = TRUE, text = text)
  chartjs
}