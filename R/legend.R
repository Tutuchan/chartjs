#' Edit legend
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param position a character to specify if the legend is on the right or on the bottom of the chart. Not implemented yet.
#' @param direction a character to specify if the legend extends horizontally or vertically. Not implemented yet.
#' @param title a character, the title of the legend.
#' @param template a Javascript template for the legend. If NULL (the default), the standard Chart.js template is used
#'
#' @export
#' @examples
#' chartjs(data, labels, title = "mpg and qsec in the mtcars dataset") %>%
#'   barChart %>%
#'   cjsLegend(title = "Variables")
cjsLegend <- function(chartjs, position = 'right', title = "", template = NULL){
  if (is.null(template)) template <- switch(chartjs$x$type,
                                            Line = paste0('<ul class="<%=config.type.toLowerCase()%>-legend"><li><b>', title, '</b></li><% for (var i = 0; i < data.datasets.length; i++){%><li><span style="background-color:<%=data.datasets[i].borderColor%>"></span><%if(data.datasets[i].label){%><%=data.datasets[i].label%><%}%></li><%}%></ul>'),
                                            Bar = paste0('<ul class="<%=config.type.toLowerCase()%>-legend"><li><b>', title, '</b></li><% for (var i = 0; i < data.datasets.length; i++){%><li><span style="background-color:<%=data.datasets[i].backgroundColor%>"></span><%if(data.datasets[i].label){%><%=data.datasets[i].label%><%}%></li><%}%></ul>'))

  chartjs$x$options$legendTemplate <- template
  chartjs
}