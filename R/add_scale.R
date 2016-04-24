#' Add a scale to an axis
#'
#' \code{cjsAddScale} adds a scale to an axis.
#'
#' See the \href{Charts.js documentation}{http://nnnick.github.io/Chart.js/docs-v2/#scales} for values in ...
#'
#' @param axis the axis on which the scale lives
#' @param type the type of scale to add
#' @param ... additional parameters
#'
#'
#' @export
cjsAddScale <- function(cjs, axis = c("x", "y", NULL), type = "category", ...){
  if (!is.null(axis)) {
    cjs$x$scales[[axis]][[length(cjs$x$scales[[axis]]) + 1]] <- list(type = type, ...)
  } else cjs$x$scale <- list(type = type, ...)
  cjs
}
#'
#' #' @export
#' cjsAddScale.cjs_bar <- function(cjs, axis = "x", type = "category", ...){
#'   cjs %>%
#'     add_scale(axis, type, ...)
#' }
#'
#' #' @export
#' cjsAddScale.cjs_line <- cjsAddScale.cjs_bar
#'
#' #' @export
#' cjsAddScale.cjs_pie <- function(cjs, ...){
#'   cjs
#' }
#' #' @export
#' cjsAddScale.cjs_radar <- function(cjs, axis = NULL, type = "radialLinear", ...){
#'   cjs %>%
#'     add_scale(axis, type, ...)
#' }
#'
#' #' @export
#' cjsAddScale.cjs_polarArea <- cjsAddScale.cjs_radar
#'
#'
#' add_scale <- function(cjs, axis, type, ...){
#'   if (!is.null(axis)) {
#'     cjs$x$scales[[axis]][[length(cjs$x$scales[[axis]]) + 1]] <- list(type = type, ...)
#'     } else cjs$x$scale <- list(type = type, ...)
#'   cjs
#' }
