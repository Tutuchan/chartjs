mergeLists <- function(l1, l2){
  if(is.null(l2)) l1 else {
    commonNames <- names(l1) %in% names(l2)
    c(l2, l1[!commonNames])
  }
}

# Find the default and actual values of a function call
createOptions <- function(fun = sys.function(sys.parent()), envir = sys.parent()){
  fm <- formals(fun)
  fm <- fm[sapply(fm, is.null)]
  fm <- sapply(names(fm), function(nm) eval(parse(text = nm), envir = envir))
  fm[!sapply(fm, is.null)]
}

# Base values
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
  list(responsive = TRUE, legend = list(display = FALSE))
}