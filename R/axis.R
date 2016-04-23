#' @export
cjsAddScale <- function(x, ...){
  UseMethod("cjsAddScale")
}

#' @export
cjsAddScale.cjs_bar <- function(cjs, axis = "x", type = "category", ...){
  cjs %>%
    add_scale(axis, type, ...)
}

#' @export
cjsAddScale.cjs_pie <- function(cjs, axis = "x", type = "radialLinear", ...){
  cjs %>%
    add_scale(axis, type, ...)
}

#' @export
cjsAddScale.cjs_line <- cjsAddScale.cjs_bar
#' @export
cjsAddScale.cjs_radar <- cjsAddScale.cjs_pie


add_scale <- function(cjs, axis, type, ...){
  cjs$x$scales[[axis]] <- list(type = type, ...)
  cjs
}
