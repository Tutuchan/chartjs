#' chartjs
#'
#' Test
#'
#' @import htmlwidgets
#' @import htmltools
#'
#' @export
chartjs <- function(x, y, width = NULL, height = NULL, type = "line") {

  # Get y data
  listY <- y
  if (length(listY) > 6) stop("Too many series. Please plot 6 or less.")
  labels <- names(y)

  # Handle colors
#   vecColors <- switch(type,
#          line = {
#
#          })

  vecColors <- RColorBrewer::brewer.pal(12, "Paired")[seq(2,12,2)]
  print(x)
  # forward options using x
  x = list(x = x,
           y = unname(listY),
           type = Hmisc::capitalize(type),
           colors = vecColors,
           labels = labels)
  print(listY)

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
