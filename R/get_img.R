#' Create a graphical object (GROB) from png or jpg
#'
#' @param filename Filepath to png or jpg file.
#'
#' @return A \code{GROB} that can be added to a ggplot.
#'
#' @importFrom grid unit

get_img <- function(filename){
  file_ext <- tools::file_ext(filename)
  FUN <- switch(
    file_ext,
    "png" = png::readPNG,
    "jpg" = jpeg::readJPEG,
    "jpeg" = jpeg::readJPEG,
    stop("Only jpg, png and jpeg are allowed")
  )
  grid::rasterGrob(FUN(filename), interpolate = TRUE,
                   x = 0.99,
                   hjust = 1)
}
