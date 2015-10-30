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
  #   basicTemplate <- c('<ul class="<%chart.id%>-legend"><li><b>', title, '</b></li><% for (var i = 0; i < chart.data.datasets.length; i++){%><li><span style="background-color:<%=chart.data.datasets[i].', "" , '%>"></span><%if(chart.data.datasets[i].label){%><%=chart.data.datasets[i].label%><%}%></li><%}%></ul>')
  #   if (is.null(template)) template <- switch(chartjs$x$type,
  #                                             Line = {
  #                                               tpl <- basicTemplate
  #                                               tpl[4] <- "borderColor"
  #                                               paste(tpl, collapse = "")
  #                                             },
  #                                             Bar = {
  #                                               tpl <- basicTemplate
  #                                               tpl[4] <- "backgroundColor"
  #                                               paste(tpl, collapse = "")
  #                                             },
  #                                             Pie = {
  #                                               paste0('<ul class="<%=config.type.toLowerCase()%>-legend"><li><b>', title, '</b></li><% for (var i = 0; i < data.datasets[0].data.length; i++){%><li><span style="background-color:<%=data.datasets[0].backgroundColor[i]%>"></span><%if(data.labels[i]){%><%=data.labels[i]%><%}%></li><%}%></ul>')
  #                                             })
  #   chartjs$x$showLegend <- TRUE
  #   chartjs$x$options$legendCallback <- paste0("function(chart){", paste(template, collapse = ""))

  legendCallback <- switch(chartjs$x$type,
                           Bar = JS("function(chart) {",
                                    "var text = [];",
                                    "text.push('<ul class=\"'.concat(chart.id, '-legend\">'));",
                                    "text.push('<li><b>'.concat(chart.data.legendTitle,'</b></li>'));",
                                    "for (var i = 0; i < chart.data.datasets.length; i++) {",
                                    "text.push('<li><span style=\"background-color:'.concat(chart.data.datasets[i].backgroundColor,'\">'));",
                                    "text.push('</span>');",
                                    "if (chart.data.datasets[i].label) {",
                                    "text.push(chart.data.datasets[i].label);",
                                    "}",
                                    "text.push('</li>');",
                                    "}",
                                    "text.push('</ul>');",
                                    "return text.join(\"\");",
                                    "}"))
  chartjs$x$showLegend <- TRUE
  chartjs$x$options$legendCallback <- legendCallback
  chartjs$x$legendTitle <- title
  chartjs


}
