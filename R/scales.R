#' Scales
#'
#' Modify an x- or y- scale. As of now, multiple scales on the same axis are not supported (but they
#' are in Chart.js). See the \href{http://nnnick.github.io/Chart.js/docs-v2/#scales}{Chart.js scales documentation}
#' for all the options (charts also have additional scales options).
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param axis a character, the axis to modify, either "x" or "y"
#' @param type a character, the type of scale for this axis
#' @param display a logical, should this scale be displayed
#' @param gridLines a list of grid lines parameters
#' @param scaleLabel a list of parameters to modify the appearance of the labels
#' @param ticks a list of parameters to modify the appearance of the ticks
#' @param callbacks a list of Javascript functions as characters. Note that these are not bundled in
#' the Chart.js library, only in the R package for easier definition. Remember to wrap those with the
#' \code{\link[htmlwidgets]{JS}} function
#' @param position a character
#' @param ... additional parameters for the differents scales categories (linear, logarithmic, time, etc.)
#' @export

cjsScale <- function(chartjs, axis = c("x", "y"), type = NULL, display = NULL, callbacks = NULL, gridLines = NULL,
                     scaleLabel = NULL, ticks = NULL, position = NULL, ...){
  stopifnot(axis %in% c("x", "y"))

  scales <- switch(axis,
                   x = list(xAxes = list()),
                   y = list(yAxes = list()))

  # Find non NULL arguments
  arguments <- match.call()
  arguments <- arguments[!names(arguments) %in% c("chartjs", "axis")]

  # Create the output list
  res <- list()
  for (i in 1:length(names(arguments))){
    nm <- names(arguments)[i]
    if (nm != "" & !nm %in% c("callbacks")) {
      nr <- names(res)
      res <- c(res, list(eval(arguments[[nm]])))
      names(res) <- c(nr, nm)
    }

    if (nm == "callbacks") {
      nr <- names(res)
      l <- unlist(eval(arguments[[nm]]))
      for (el in l) res <- c(res, list(el))
      names(res) <- c(nr, names(l))
    }
  }
  scales[[1]] <- list(res)
  chartjs$x$options$scales <- mergeLists(chartjs$x$options$scales, scales)
  chartjs
}