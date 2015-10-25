tt <- function(data, ..., group = NULL){
  ldots <- lazyeval::lazy_dots(...)
  print(ldots)
  data <- data %>%
    dplyr::select_(.dots = ldots)
  print(lazyeval::lazy(group))
  # if (!is.null(group)) {

  labels = sort(unique(data[[]]))
  # }
  list(data, labels)
}