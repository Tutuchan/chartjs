#' Add title
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param title the title of the chart
#' @param position "top" or "bottom", defaults to "top"
#' @param fullWidth a logical, defaults to TRUE
#' @param fontColor a character, defaults to "#666"
#' @param fontFamily a character, defaults to "Helvetica Neue"
#' @param fontSize an integer, defaults to 12
#' @param fontStyle a character, defaults to "bold"
#' @param padding a integer, defaults to 10 (in pixels)
#'
#' @export

cjsTitle <- function(chartjs, title, position = NULL, fullWidth = NULL, fontColor = NULL,
                     fontFamily = NULL, fontSize = NULL, fontStyle = NULL, padding = NULL){
  chartjs$x$options$title <- c(list(display = TRUE, text = title), createOptions())
  chartjs
}