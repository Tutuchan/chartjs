#' Edit an existing scale
#'
#' \code{cjsEditScale} allows the editing of an existing scale.
#'
#' See the \href{http://www.chartjs.org/docs/#scales}{Charts.js documentation} for values in ...
#'
#' @param cjs a \code{\link{chartjs}} object
#' @param axis the axis on which the scale lives
#' @param scale the numeric position of the scale
#' @param ... parameters to edit
#'
#'
#' @export
cjsEditScale <- function(cjs, axis = c("x", "y", NULL), scale, ...){
  if (!is.null(axis)) {
    cjs$x$scales[[axis]][[scale]] <- mergeLists(cjs$x$scales[[axis]][[scale]], list(...))
  } else cjs$x$scale <- mergeLists(cjs$x$scale, list(...))
  cjs
}

