#' Line chart
#'
#' This function takes a \code{chartjs} object created by the \code{\link{chartjs}}
#' function and draws a line chart.
#'
#' The \code{\link{chartjs}} object \code{data} parameter should be a named list
#' of numeric vectors.
#'
#' @param chartjs a \code{\link{chartjs}} object
#'
#'@export

cjsLine <- function(chartjs){

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
             borderColor = vecColors[seq(2,lColors,2)][i],
             backgroundColor = "rgba(0,0,0,0)",
             pointBorderColor = vecColors[seq(1,lColors,2)][i],
             pointBackgroundColor = vecColors[seq(2,lColors,2)][i],
             pointHoverBorderColor = vecColors[seq(2,lColors,2)][i],
             pointHoverBackgroundColor = vecColors[seq(1,lColors,2)][i]
      )
    } else cjsColours[[colorType]])
    names(listColors) <- colorTypes
    res <- list(label = chartjs$x$dataLabels[i],
                data = chartjs$x$data[[i]])
    c(res, listColors)
  })

  # Add type and data to pass to Chart.js
  chartjs$x$type <- "line"
  chartjs$x$data <- list(labels = chartjs$x$labels,
                         datasets = datasets)
  # Clean up
  chartjs$x$labels <- NULL
  chartjs$x$dataLabels <- NULL
  chartjs$x$colours <- NULL
  chartjs
}
