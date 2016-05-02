#' Pipe operator
#'
#' Imports the pipe operator from magrittr.
#'
#' @importFrom magrittr %>%
#' @export
#' @param lhs a \code{\link{chartjs}} object
#' @param rhs a charting function
#' @rdname pipe
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
  list(responsive = TRUE, maintainAspectRatio = TRUE, legend = list(display = FALSE))
}

# Find the default and actual values of a function call
createOptions <- function(fun = sys.function(sys.parent()), envir = sys.parent()){
  fm <- formals(fun)
  fm <- fm[sapply(fm, is.null)]
  fm <- sapply(names(fm), function(nm) eval(parse(text = nm), envir = envir))
  fm[!sapply(fm, is.null)]
}