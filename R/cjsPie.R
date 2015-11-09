#' Pie chart
#'
#' This function takes a \code{chartjs} object created by the \code{\link{chartjs}}
#' function and draws a pie chart.
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
  datasets <- lapply(seq_along(chartjs$x$data), function(i) {
    listColors <- lapply(colorTypes,  function(colorType) if (!colorType %in% names(cjsColours)){
      switch(colorType,
             borderColor = "#000000",
             backgroundColor = vecColors[seq(1,lColors,2)][i],
             hoverBorderColor =  "rgba(255,255,255,1)",
             hoverBackgroundColor = vecColors[seq(2,lColors,2)][i]
      )
    } else cjsColours[[colorType]])
    names(listColors) <- colorTypes
    res <- list(data = chartjs$x$data[[i]])
    c(res, listColors[!sapply(listColors, is.null)])
  })

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
