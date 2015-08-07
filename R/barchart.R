#' Draw a bar chart
#'
#' @export

barChart <- function(chartjs, colours = NULL){
  # Add colors to the color list if they are not present
  vecColors <- chartjs:::.vecColors[1:(2*length(chartjs$x$y))]
  lColors <- length(vecColors)

  listColors <- lapply(chartjs:::.colorTypes, function(colorType) if (!colorType %in% names(colours)){
    if(colorType %in% c("strokeColor", "fillColor")) vecColors[seq(1,lColors,2)] else vecColors[seq(2,lColors,2)]
  } else colours[[colorType]])
  names(listColors) <- .colorTypes
  chartjs$x$colors <- listColors
  chartjs$x$type <- "Bar"
  chartjs
}