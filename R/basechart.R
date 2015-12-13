#' Base chart creation
#'
#' This is a low-level function called by the charts creation functions. It adds
#' colors and chart type to the object that will be interpreted by the Chart.js
#' library.
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param type a character, the type of chart
#' @name baseChart
#' @keywords internal

baseChart <- function(chartjs, type){
  if(!type %in% c("bar", "line", "pie", "polararea", "radar", "scatter")) stop("incorrect type")
  # Initialize colours
  cjsColours <- chartjs$x$colours
  vecColors <- baseColors()
  colorTypes <- baseTypes()
  vecColors <- vecColors[1:(2*length(chartjs$x$data))]
  lColors <- length(vecColors)

  # Create the datasets part
  # Pie charts behave differently
  datasets <- if (type == "pie"){
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
    list(c(list(data = unname(chartjs$x$data)),
                       listColors[!sapply(listColors, is.null)]))
  } else {
    lapply(seq_along(chartjs$x$data), function(i) {
      listColors <- lapply(colorTypes,  function(colorType) if (!colorType %in% names(cjsColours)){
        switch(type,
               bar = switch(colorType,
                            borderColor = "#000000",
                            backgroundColor = vecColors[seq(1,lColors,2)][i],
                            hoverBorderColor =  "rgba(255,255,255,1)",
                            hoverBackgroundColor = vecColors[seq(2,lColors,2)][i]
               ),
               line = switch(colorType,
                             borderColor = vecColors[seq(2,lColors,2)][i],
                             backgroundColor = "rgba(0,0,0,0)",
                             pointBorderColor = vecColors[seq(1,lColors,2)][i],
                             pointBackgroundColor = vecColors[seq(2,lColors,2)][i],
                             pointHoverBorderColor = vecColors[seq(2,lColors,2)][i],
                             pointHoverBackgroundColor = vecColors[seq(1,lColors,2)][i]
               ),
               radar = switch(colorType,
                              borderColor = vecColors[seq(2,lColors,2)][i],
                              backgroundColor = "rgba(0,0,0,0)",
                              pointBorderColor = vecColors[seq(1,lColors,2)][i],
                              pointBackgroundColor = vecColors[seq(2,lColors,2)][i],
                              pointHoverBorderColor = vecColors[seq(2,lColors,2)][i],
                              pointHoverBackgroundColor = vecColors[seq(1,lColors,2)][i]))
      } else cjsColours[[colorType]])
      names(listColors) <- colorTypes
      res <- list(label = chartjs$x$dataLabels[i],
                  data = chartjs$x$data[[i]])
      c(res, listColors)
    })
  }
  # Add type and data to pass to Chart.js
  chartjs$x$type <- type
  chartjs$x$data <- list(labels = chartjs$x$labels,
                         datasets = datasets)
  # Clean up
  chartjs$x$labels <- NULL
  chartjs$x$dataLabels <- NULL
  chartjs$x$colours <- NULL
  chartjs
}

