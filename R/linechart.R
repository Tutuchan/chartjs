#' Draw a line chart
#'
#' @export

lineChart <- function(chartjs, colours = NULL){
  # Add colors to the color list if they are not present
  vecColors <- chartjs:::.vecColors[1:(2*length(chartjs$x$y))]
  lColors <- length(vecColors)

  listColors <- lapply(chartjs:::.colorTypes, function(colorType) if (!colorType %in% names(colours)){
    switch(colorType,
           strokeColor = vecColors[seq(2,lColors,2)],
           pointColor = vecColors[seq(2,lColors,2)],
           fillColor = rep("rgba(0,0,0,0)",lColors/2),
           highlightStroke = rep("rgba(0,0,0,0)",lColors/2),
           highlightFill = vecColors[seq(1,lColors,2)],
           pointStrokeColor = rep("rgba(0,0,0,0)",lColors/2),
           pointHighlightStroke = rep("rgba(0,0,0,1)",lColors/2),
           pointHighlightFill = vecColors[seq(1,lColors,2)]
    )
  } else colours[[colorType]])

  names(listColors) <- .colorTypes
  listColors <- listColors[!is.null(listColors)]
  chartjs$x$colors <- listColors
  chartjs$x$type <- "Line"
  chartjs
}