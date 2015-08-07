#' Draw a pie chart
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param colours an optional list of colours
#' @param inner a numeric, the percentage of the inner cutout
#'
#' @export

pieChart <- function(chartjs, colours = NULL, inner = 0){
  # Add colors to the color list if they are not present
  vecColors <- chartjs:::.vecColors[1:(2*length(chartjs$x$y))]
  lColors <- length(vecColors)

  listColors <- lapply(chartjs:::.colorTypes, function(colorType) if (!colorType %in% names(colours)){
    if(colorType %in% c("color")) vecColors[seq(1,lColors,2)] else vecColors[seq(2,lColors,2)]
  } else colours[[colorType]])
  names(listColors) <- chartjs:::.colorTypes
  chartjs$x$colors <- listColors
  chartjs$x$type <- "Pie"
  chartjs$x$inner <- inner
  chartjs
}