mergeLists <- function(l1, l2){
  if(is.null(l2)) l1 else {
    commonNames <- names(l1) %in% names(l2)
    c(l2, l1[!commonNames])
  }
}