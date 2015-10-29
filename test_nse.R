tt <- function(data, ..., group = NULL){
  ldots <- lazyeval::lazy_dots(...)
  lzgroup <- lazyeval::lazy(group, env = data)
  if (!is.null(lzgroup$expr)) {
    grp <- sort(unique(lazyeval::lazy_eval(lzgroup, data = data)))
    data <- lapply(grp, function(x) {
      data %>%
        filter_(.dots = interp(~ j == i, i = x, j = lzgroup$expr)) %>%
        select_(.dots = ldots)
      })
    names(data) <- paste0(lzgroup$expr, grp)
  }
  data
}