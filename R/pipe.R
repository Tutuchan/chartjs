#' Pipe operator
#'
#' Imports the pipe operator from magrittr.
#'
#' @importFrom magrittr %>%
#' @export
#' @param lhs a \code{\link{chartjs}} object
#' @param rhs a charting function
#' @rdname pipe
#' @examples
#' chartjs(list(mpg = mtcars$mpg), labels = row.names(mtcars)) %>% cjsLine
`%>%` <- magrittr::`%>%`