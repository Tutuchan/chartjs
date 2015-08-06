#' chartjs
#'
#' Draw a graph using the Chart.js library
#'
#' See the documentation of Chart.js at \url{http://www.chartjs.org/docs}.
#'
#' @param x a vector of numerics or characters : the labels on the x-axis
#' @param y a named list of the y-axis data
#' @param width the width of the widget
#' @param height the height of the widget
#' @param type a character : the type of the widget, currently supports \code{line} or \code{bar}.
#' @param chartOptions a list of chartOptions to customize the graph
#'
#'
#'
#' @import htmlwidgets
#' @import htmltools
#'
#' @export
chartjs <- function(x, y, width = NULL, height = NULL, type = "line", chartOptions = NULL) {

  # Get y data
  listY <- y
  lY <- length(listY)
  if (lY > 6) stop("Too many series. Please plot 6 or less.")
  labels <- names(y)


  vecColors <- RColorBrewer::brewer.pal(12, "Paired")[1:(2*lY)]
  lColors <- length(vecColors)
  #### Handle chartOptions
  if(is.null(chartOptions)){
    chartOptions <- list()
  }
  # Add colors to the color list if they are not present
  colorTypes <- c("strokeColor", "fillColor", "highlightStroke", "highlightFill", "pointColor", "pointStrokeColor", "pointHighlightFill", "pointHighlightStroke")

  listColors <- switch(type,
                       line = lapply(colorTypes, function(colorType) if (!colorType %in% names(chartOptions)){
                         if(colorType %in% c("strokeColor", "pointColor")) vecColors[seq(2,lColors,2)] else {
                           if (colorType %in% c("fillColor", "pointStrokeColor")) rep("rgba(0,0,0,0)",lColors/2) else vecColors[seq(1,lColors,2)]
                         }
                       } else chartOptions[[colorType]]),
                       bar = lapply(colorTypes, function(colorType) if (!colorType %in% names(chartOptions)){
                         if(colorType %in% c("strokeColor", "fillColor")) vecColors[seq(1,lColors,2)] else vecColors[seq(2,lColors,2)]
                       } else chartOptions[[colorType]]))
  names(listColors) <- colorTypes


  print(x)
  # forward chartOptions using x
  x = list(x = x,
           y = unname(listY),
           type = Hmisc::capitalize(type),
           colors = listColors,
           labels = labels)
  print(listY)

  # create widget
  htmlwidgets::createWidget(
    name = 'chartjs',
    x = x,
    width = width,
    height = height,
    # sizingPolicy = htmlwidgets::sizingPolicy(browser.fill = TRUE),
    package = 'chartjs'
  )
}

#' @export
chartjs_html <- function(id, style, class, ...){
  tags$div(class = "chart-container", tags$canvas(id = id, class = class))
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
