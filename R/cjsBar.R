cjsBar <- function(data, xLabels = NULL, yLabels = NULL, colours = NULL, options = NULL){
  if (length(data) > 6 & (is.null(colours))) stop("too many series, provide 6 or less ")

  vecColors <- baseColors()
  colorTypes <- baseTypes()

  vecColors <- vecColors[1:(2*length(data))]
  lColors <- length(vecColors)

  # Handle labels
  if (is.null(yLabels)) yLabels <- paste("var", 1:length(data))
  if (is.null(xLabels)) xLabels <- paste(1:max(sapply(data, length)))

  # Create the datasets part
  datasets <- lapply(seq_along(data), function(i) {
    listColors <- lapply(colorTypes,  function(colorType) if (!colorType %in% names(colours)){
      switch(colorType,
             borderColor = "#000000",
             backgroundColor = vecColors[seq(1,lColors,2)][i],
             hoverBorderColor =  "rgba(255,255,255,1)",
             hoverBackgroundColor = vecColors[seq(2,lColors,2)][i]
      )
    })
    names(listColors) <- colorTypes
    res <- list(label = yLabels[i],
         data = data[[i]])
    c(res, listColors)
  })

  # Add options
  options <- mergeLists(baseOptions(), options)

  list(type = "bar",
       data = list(labels = xLabels,
                   datasets = datasets),
       options = options)
}
