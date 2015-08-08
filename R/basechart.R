#' Draw a base chart
#'
#' Base function for charts
.vecColors <- RColorBrewer::brewer.pal(12, "Paired")

.colorTypes <- c("strokeColor", "fillColor", "highlightStroke", "highlightFill",
                 "pointColor", "pointStrokeColor", "pointHighlightFill", "pointHighlightStroke",
                 "color", "highlight")

baseChart <- function(chartjs, type, colours = NULL){
  # Add colors to the color list if they are not present
  vecColors <- .vecColors[1:(2*length(chartjs$x$y))]
  lColors <- length(vecColors)

  listColors <- lapply(.colorTypes, function(colorType) if (!colorType %in% names(colours)){
    switch(type,
           Line = {
             switch(colorType,
                    strokeColor = vecColors[seq(2,lColors,2)],
                    pointColor = vecColors[seq(2,lColors,2)],
                    fillColor = rep("rgba(0,0,0,0)",lColors/2),
                    highlightStroke = rep("rgba(0,0,0,0)",lColors/2),
                    highlightFill = vecColors[seq(1,lColors,2)],
                    pointStrokeColor = rep("rgba(0,0,0,0)",lColors/2),
                    pointHighlightStroke = rep("rgba(0,0,0,1)",lColors/2),
                    pointHighlightFill = vecColors[seq(1,lColors,2)])
           },
           Radar = {
             switch(colorType,
                    strokeColor = vecColors[seq(2,lColors,2)],
                    pointColor = vecColors[seq(2,lColors,2)],
                    fillColor = apply(col2rgb(vecColors[seq(1,12,2)]), 2, function(x) paste0("rgba(", x[1], ", ", x[2], ", ", x[3], ", 0.2)")),
                    highlightStroke = rep("rgba(0,0,0,0)",lColors/2),
                    highlightFill = vecColors[seq(1,lColors,2)],
                    pointStrokeColor = rep("rgba(0,0,0,0)",lColors/2),
                    pointHighlightStroke = rep("rgba(0,0,0,1)",lColors/2),
                    pointHighlightFill = vecColors[seq(1,lColors,2)])
           },
           Bar = {
             if(colorType %in% c("strokeColor", "fillColor")) vecColors[seq(1,lColors,2)] else vecColors[seq(2,lColors,2)]
           },
           Pie = {
             if(colorType %in% c("color")) vecColors[seq(1,lColors,2)] else vecColors[seq(2,lColors,2)]
           },
           Doughnut =  {
             if(colorType %in% c("color")) vecColors[seq(1,lColors,2)] else vecColors[seq(2,lColors,2)]
           })
  } else colours[[colorType]])

  names(listColors) <- .colorTypes
  listColors <- listColors[!is.null(listColors)]
  chartjs$x$colors <- listColors
  chartjs$x$type <- type
  chartjs
}

