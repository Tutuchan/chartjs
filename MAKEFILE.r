files <- list.files(pattern = "*.Rmd")
lapply(files, rmarkdown::render)
