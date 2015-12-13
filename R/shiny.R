#' Shiny bindings for chartjs
#'
#' @param outputId the widget id in the server part of the application
#' @param width the width of the widget
#' @param height the height of the widget
#' @name shiny-chartjs
#' @export
chartjsOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'chartjs', width, height, package = 'chartjs')
}



#' @param expr an R expression that evaluates to a \code{\link{chartjs}} object
#' @param env the environment in which to evaluate \code{expr}
#' @param quoted a boolean, is \code{expr} a quoted expression ?
#' @rdname shiny-chartjs
#' @export
renderChartjs <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, chartjsOutput, env, quoted = TRUE)
}