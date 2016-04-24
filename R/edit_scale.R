#' Edit an existing scale
#'
#' \code{cjsEditScale} allows the editing of an existing scale.
#'
#' See the \href{Charts.js documentation}{http://nnnick.github.io/Chart.js/docs-v2/#scales} for values in ...
#'
#' @param axis the axis on which the scale lives
#' @param scale the numeric position of the scale
#' @param ... parameters to edit
#'
#'
#' @export
cjsEditScale <- function(cjs, axis = c("x", "y", NULL), scale, ...){
  if (!is.null(axis)) {
    cjs$x$scales[[axis]][[scale]] <- list(...)
  } else cjs$x$scale <- list(...)
  cjs
}

