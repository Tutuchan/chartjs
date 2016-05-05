#' Color types
#'
#' Allowed color types
#'
#' When adding custom colours to a chart, the color argument should have the structure displayed in
#' the example and \strong{ALL} necessary colors must be given.
#'
#' @param borderColor for all charts
#' @param backgroundColor for all charts
#' @param pointBorderColor for Line, Radar and Scatter charts
#' @param pointBackgroundColor for Line, Radar and Scatter charts
#' @param hoverBorderColor for Bar, Pie, Doughnut and PolarArea charts
#' @param hoverBackgroundColor for Bar, Pie, Doughnut and PolarArea charts
#' @param pointHoverBorderColor for Line, Radar and Scatter charts
#' @param pointHoverBackgroundColor for Line, Radar and Scatter charts
#' @name colortypes
#'
#' @examples color <- list(background = "#FF0000",
#'               border = "#00FF00",
#'               hover = list(background = "#FF0000",
#'                            border = "#00FF00"),
#'               point = list(background = "#FF0000",
#'                            border = "#00FF00",
#'                            hover = list(background = "#FF0000",
#'                                         border = "#00FF00")))
NULL

# Format a list of colours for a type of graph and possible existing series
cjs_get_colours <- function(chartjs, n){
  if (!is.list(chartjs$x$palette)) {
    vecColors <- baseColors(chartjs$x$palette)
    chartjs %>% cjs_get_chart_colours(vecColors, n)
  } else chartjs %>% cjs_get_custom_colours(n)

}

cjs_get_chart_colours <- function(x, ...){
  UseMethod("cjs_get_chart_colours")
}

cjs_get_chart_colours.cjs_bar <- function(chartjs, vecColors, n) {
    list(borderColor = "#000000",
         backgroundColor = vecColors[(2*n)+1],
         hoverBorderColor =  "rgba(255,255,255,1)",
         hoverBackgroundColor = vecColors[2*(n+1)])
}

cjs_get_chart_colours.cjs_horizontalBar <- cjs_get_chart_colours.cjs_bar


cjs_get_chart_colours.cjs_line <- function(chartjs, vecColors, n) {
  list(borderColor = vecColors[2* (n + 1)],
       backgroundColor = "rgba(0,0,0,0)",
       pointBorderColor = vecColors[(2 * n) + 1],
       pointBackgroundColor = vecColors[2 * (n + 1)],
       pointHoverBorderColor = vecColors[2 * (n + 1)],
       pointHoverBackgroundColor = vecColors[(2 * n) + 1])
}

cjs_get_chart_colours.cjs_radar <- function(chartjs, vecColors, n) {
  list(borderColor = vecColors[2*(n+1)],
       backgroundColor = "rgba(0,0,0,0)",
       pointBorderColor = vecColors[(2*n)+1],
       pointBackgroundColor = vecColors[2*(n+1)],
       pointHoverBorderColor = vecColors[2*(n+1)],
       pointHoverBackgroundColor = vecColors[(2*n)+1])
}

cjs_get_chart_colours.cjs_pie <- function(chartjs, vecColors, n) {
  lColors <- length(vecColors)
  list(borderColor = rep("rgba(255,255,255,0)", n),
       backgroundColor = vecColors[seq(1, lColors, 2)][1:n],
       hoverBorderColor =  rep("#000000", n),
       hoverBackgroundColor = vecColors[seq(2, lColors, 2)][1:n])
}

cjs_get_chart_colours.cjs_polarArea <- cjs_get_chart_colours.cjs_pie


# Get custom colours
cjs_get_custom_colours <- function(chartjs, n){
  listColors <- chartjs$x$palette
  n <- n + 1
  res <- list(borderColor = listColors$border[n],
              backgroundColor = listColors$background[n],
              pointBorderColor = listColors$point$border[n],
              pointBackgroundColor = listColors$point$background[n],
              hoverBorderColor = listColors$hover$border[n],
              hoverBackgroundColor = listColors$hover$background[n],
              pointHoverBorderColor = listColors$point$hover$border[n],
              pointHoverBackgroundColor = listColors$point$hover$background[n])
  res[!sapply(res, is.null)]
}

# Base colors
baseColors <- function(palette){
  if (!is.null(palette)){
    info <- RColorBrewer::brewer.pal.info
    info <- info[row.names(info) == palette,]
    RColorBrewer::brewer.pal(info$maxcolors, palette)
  }
}

# Base color types
baseTypes <- function(){
  c("borderColor", "backgroundColor",
    "pointBorderColor", "pointBackgroundColor",
    "hoverBorderColor", "hoverBackgroundColor",
    "pointHoverBorderColor", "pointHoverBackgroundColor")
}