#' Draw a doughnut chart
#'
#' @inheritParams pieChart
#'
#' @export

doughnutChart <- function(chartjs, colours = NULL, inner = 50){
  pieChart(chartjs, colours, inner)
}