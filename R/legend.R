#' Add legends
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param position "top" or "bottom", defaults to "top"
#' @param onClick a JS function as a character
#' @param fullWidth a logical, defaults to TRUE
#' @param labels a list of parameters for the labels : \itemize{
#'  \item boxWidth an integer, defaults to 40
#'  \item fontColor a character, defaults to "#666"
#'  \item fontFamily a character, defaults to "Helvetica Neue"
#'  \item fontSize an integer, defaults to 12
#'  \item fontStyle a character, defaults to "normal"
#'  \item padding a integer, defaults to 10 (in pixels)
#' }
#'
#'
#' @export

cjsLegend <- function(chartjs, position = NULL, onClick = NULL, fullWidth = NULL, labels = NULL){
  chartjs$x$options$legend <- c(list(display = TRUE), createOptions())
  chartjs
}