#' chartjs
#'
#' Test
#'
#' @import htmlwidgets
#' @import htmltools
#'
#' @export
chartjs <- function(dataframe, width = NULL, height = NULL) {


  # forward options using x
  x = list(
    x = dataframe$x,
    y = dataframe$y
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'chartjs',
    x = x,
    width = width,
    height = height,
    package = 'chartjs'
  )
}

#' @export
chartjs_html <- function(id, style, class, ...){
  tags$canvas(id = id, class = class)
}

#' Widget output function for use in Shiny
#'
#' @export
chartjsOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'chartjs', width, height, package = 'chartjs')
}

#' Widget render function for use in Shiny
#'
#' @export
renderChartjs <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, chartjsOutput, env, quoted = TRUE)
}
