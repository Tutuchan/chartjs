#' Pie and doughnut charts
#'
#' These functions take a \code{chartjs} object created by the \code{\link{chartjs}}
#' function and draw a pie or a doughnut chart.
#'
#' The \code{\link{chartjs}} object \code{data} parameter should be a named vector (or list)
#' of numerics
#'
#' @param chartjs a \code{\link{chartjs}} object
#'
#'@export

cjsPie <- function(chartjs){

  # Initialize colours
  cjsColours <- chartjs$x$colours
  vecColors <- baseColors()
  colorTypes <- baseTypes()
  vecColors <- vecColors[1:(2*length(chartjs$x$data))]
  lColors <- length(vecColors)

  # Create the datasets part
  len <- length(chartjs$x$data)
  listColors <- lapply(colorTypes,  function(colorType) if (!colorType %in% names(cjsColours)){
    switch(colorType,
           borderColor = rep("rgba(255,255,255,1)", len),
           backgroundColor = vecColors[seq(1,lColors,2)][1:len],
           hoverBorderColor =  rep("#000000", len),
           hoverBackgroundColor = vecColors[seq(2,lColors,2)][1:len]
    )
  } else cjsColours[[colorType]])
  names(listColors) <- colorTypes
  datasets <- list(c(list(data = unname(chartjs$x$data)),
                     listColors[!sapply(listColors, is.null)]))

  # Add type and data to pass to Chart.js
  chartjs$x$type <- "pie"
  chartjs$x$data <- list(labels = chartjs$x$labels,
                         datasets = datasets)
  # Clean up
  chartjs$x$labels <- NULL
  chartjs$x$dataLabels <- NULL
  chartjs$x$colours <- NULL
  chartjs
}

#' @rdname cjsPie
#' @param cutout a numeric, the percentage of the chart that is cut out of the middle
#' @export
cjsDoughnut <- function(chartjs, cutout = 50){
  chartjs$x$options$cutoutPercentage <- cutout
  cjsPie(chartjs = chartjs)
}


