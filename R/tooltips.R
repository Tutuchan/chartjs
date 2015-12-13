#' Edit default tooltips
#'
#' Allows editing of the default tooltips.
#'
#' @param chartjs a \code{\link{chartjs}} object
#' @param ... named arguments, see Details
#'
#' The allowed values in \code{...} are :
#'
#' \tabular{ll}{
#'   enabled \tab logical, defaults to TRUE \cr
#'   custom  \tab character containing a Javascript function, defaults to 'null' \cr
#'   backgroundColor \tab character, defaults to 'rgba(0,0,0,0.8)' \cr
#'   fontFamily \tab character vector, defaults to "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif" \cr
#'   fontSize \tab numeric, defaults to 10 \cr
#'   fontStyle \tab character, defaults to "normal" \cr
#'   fontColor \tab character, defaults to "#fff" \cr
#'   titleFontFamily \tab character, defaults to "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif" \cr
#'   titleFontSize \tab numeric, defaults to 12 \cr
#'   titleFontStyle \tab character, defaults to "bold" \cr
#'   titleColor \tab character, defaults to "#fff" \cr
#'   yPadding \tab numeric, defaults to 6 \cr
#'   xPadding \tab numeric, defaults to 6 \cr
#'   caretSize \tab numeric, defaults to 8 \cr
#'   cornerRadius \tab numeric, defaults to 6 \cr
#'   xOffset \tab numeric, defaults to 10 \cr
#'   template \tab character, defaults to "<\% if(label){ \%><\%=label \%>: <\% } \%><\%=value \%>" \cr
#'   multiTemplate \tab character, defaults to "<\%if (datasetLabel){ \%><\%=datasetLabel \%>: <\% } \%><\%=value \%>" \cr
#'   multiKeyBackground \tab character, defaults to '#fff' \cr
#' }
#' @export
#' @name tooltips
#' @examples
#' labels <- row.names(mtcars)
#' data <- list(mpg = mtcars$mpg, qsec = mtcars$qsec)
#'
#' # Change tooltip title color
#' chartjs(data, labels) %>%
#'   cjsBar %>%
#'   cjsTooltips(titleFontColor = "#f0f")
cjsTooltips <- function(chartjs, ...){
  ldots <- list(...)
  chartjs$x$options$tooltips <- ldots
  chartjs
}