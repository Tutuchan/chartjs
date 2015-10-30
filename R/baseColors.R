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