#' Add title
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param text a character
#' @param direction a character to specify if the legend extends horizontally or vertically. Not implemented yet.
#' @param title a character, the title of the legend.
#' @param template a Javascript template for the legend. If NULL (the default), the standard Chart.js template is used
#'
#' @export

cjsTitle <- function(chartjs, text){
  chartjs$x$options$title <- list(display = TRUE, text = text)
  chartjs
}