#' Color types
#'
#' Allowed color types
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
NULL


# Format a list of colours for a type of graph and possible existing series
getColours <- function(type, listColors, l){
  if (is.null(listColors)) {
    vecColors <- baseColors()
    lColors <- length(vecColors)
    switch(type,
           bar = list(borderColor = "#000000",
                      backgroundColor = vecColors[(2*l)+1],
                      hoverBorderColor =  "rgba(255,255,255,1)",
                      hoverBackgroundColor = vecColors[2*(l+1)]),
           line = list(borderColor = vecColors[2*(l+1)],
                       backgroundColor = "rgba(0,0,0,0)",
                       pointBorderColor = vecColors[(2*l)+1],
                       pointBackgroundColor = vecColors[2*(l+1)],
                       pointHoverBorderColor = vecColors[2*(l+1)],
                       pointHoverBackgroundColor = vecColors[(2*l)+1]),
           radar = list(borderColor = vecColors[2*(l+1)],
                        backgroundColor = "rgba(0,0,0,0)",
                        pointBorderColor = vecColors[(2*l)+1],
                        pointBackgroundColor = vecColors[2*(l+1)],
                        pointHoverBorderColor = vecColors[2*(l+1)],
                        pointHoverBackgroundColor = vecColors[(2*l)+1]),
           pie = list(borderColor = rep("rgba(255,255,255,1)", l),
                      backgroundColor = vecColors[seq(1, lColors, 2)][1:l],
                      hoverBorderColor =  rep("#000000", l),
                      hoverBackgroundColor = vecColors[seq(2, lColors, 2)][1:l]))
  } else {
    res <- list(borderColor = listColors$border,
                backgroundColor = listColors$background,
                pointBorderColor = listColors$point$border,
                pointBackgroundColor = listColors$point$background,
                hoverBorderColor = listColors$hover$border,
                hoverBackgroundColor = listColors$hover$background,
                pointHoverBorderColor = listColors$point$hover$border,
                pointHoverBackgroundColor = listColors$point$hover$background)
    res[!sapply(res, is.null)]
  }

}