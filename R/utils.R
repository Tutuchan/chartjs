mergeLists <- function(l1, l2){
  if(is.null(l2)) l1 else {
    commonNames <- names(l1) %in% names(l2)
    c(l2, l1[!commonNames])
  }
}

baseColors <- function(){
  RColorBrewer::brewer.pal(12, "Paired")
}

baseTypes <- function(){
  c("borderColor", "backgroundColor",
    "pointBorderColor", "pointBackgroundColor",
    "hoverBorderColor", "hoverBackgroundColor",
    "pointHoverBorderColor", "pointHoverBackgroundColor")
}

baseOptions <- function(){
  list(responsive = TRUE)
}