#' Base chart creation
#'
#' This is a low-level function called by the charts creation functions. It adds
#' colors and chart type to the object that will be interpreted by the Chart.js
#' library.
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param type a character, the type of chart
#' @param colours an optional list of colours. If NULL, default colors from the
#' \strong{Paired} palette of the RColorBrewer package will be used.
#' @name baseChart
#' @keywords internal
.vecColors <- RColorBrewer::brewer.pal(12, "Paired")

.colorTypes <- c("borderColor", "backgroundColor",
                 "pointBorderColor", "pointBackgroundColor",
                 "hoverBorderColor", "hoverBackgroundColor",
                 "pointHoverBorderColor", "pointHoverBackgroundColor")

baseChart <- function(chartjs, type, colours = NULL){
  if(!type %in% c("Bar", "Line", "Pie", "PolarArea", "Radar", "Scatter")) stop("incorrect type")
  # Add colors to the color list if they are not present
  vecColors <- .vecColors[1:(2*length(chartjs$x$data))]
  lColors <- length(vecColors)

  listColors <- lapply(.colorTypes, function(colorType) if (!colorType %in% names(colours)){
    switch(type,
           Line = {
             switch(colorType,
                    borderColor = vecColors[seq(2,lColors,2)],
                    backgroundColor = rep("rgba(0,0,0,0)",lColors/2),
                    pointBorderColor = vecColors[seq(1,lColors,2)],
                    pointBackgroundColor = vecColors[seq(2,lColors,2)],
                    pointHoverBorderColor = vecColors[seq(2,lColors,2)],
                    pointHoverBackgroundColor = vecColors[seq(1,lColors,2)]
                    )
           },
           Radar = {
             switch(colorType,
                    borderColor = vecColors[seq(2,lColors,2)],
                    backgroundColor = apply(col2rgb(vecColors[seq(1,lColors,2)]), 2, function(x) paste0("rgba(", x[1], ", ", x[2], ", ", x[3], ", 0.2)")),
                    pointBorderColor = vecColors[seq(2,lColors,2)],
                    pointBackgroundColor = vecColors[seq(2,lColors,2)],
                    pointHoverBorderColor = vecColors[seq(1,lColors,2)],
                    pointHoverBackgroundColor = rep("rgba(0,0,0,0)",lColors/2)
             )
           },
           Bar = {
             switch(colorType,
                    borderColor = rep("#000000",lColors/2),
                    backgroundColor = vecColors[seq(1,lColors,2)],
                    hoverBorderColor =  rep("rgba(255,255,255,1)",lColors/2),
                    hoverBackgroundColor = vecColors[seq(2,lColors,2)]
             )
           },
           Pie = {
             switch(colorType,
                    borderColor = rep("rgba(0,0,0,0)",lColors/2),
                    backgroundColor = vecColors[seq(1,lColors,2)],
                    hoverBorderColor = rep("rgba(0,0,0,0)",lColors/2),
                    hoverBackgroundColor = vecColors[seq(2,lColors,2)]
             )
           },
           PolarArea = {
             switch(colorType,
                    borderColor = rep("rgba(0,0,0,0)",lColors/2),
                    backgroundColor = vecColors[seq(1,lColors,2)],
                    hoverBorderColor = vecColors[seq(1,lColors,2)],
                    hoverBackgroundColor = vecColors[seq(2,lColors,2)])
           },
           Scatter = {
             switch(colorType,
                    borderColor = vecColors[seq(2,lColors,2)],
                    backgroundColor = rep("rgba(0,0,0,0)",lColors/2),
                    pointBorderColor = vecColors[seq(1,lColors,2)],
                    pointBackgroundColor = vecColors[seq(2,lColors,2)]
             )
           })
  } else colours[[colorType]])

  names(listColors) <- .colorTypes
  listColors <- listColors[!unname(unlist(lapply(listColors, is.null)))]
  chartjs$x$colors <- listColors
  chartjs$x$type <- type
  chartjs
}

