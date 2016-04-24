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
#' chartjs(mtcars, mpg) %>% cjsLine
`%>%` <- magrittr::`%>%`

# Merge two lists
mergeLists <- function(l1, l2){
  if(is.null(l2)) l1 else {
    commonNames <- names(l1) %in% names(l2)
    c(l2, l1[!commonNames])
  }
}

# Base options
baseOptions <- function(){
  list(responsive = TRUE, legend = list(display = FALSE))
}