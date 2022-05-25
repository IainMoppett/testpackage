#' Create a graphical object (GROB) from png or jpg
#'
#' @param filename Filepath to png or jpg file.
#' @param FUN Import function. Switches internally between \code{png::readPNG} and \code{jpeg::readJPEG}
#' @inheritParams grid::rasterGrob
#'
#'
#' @return A \code{GROB} that can be added to a ggplot.

get_img <- function(filename,
                    FUN = png::readPNG,
                    x = unit(0.5, "npc"),
                    y= unit(0.5, "npc"),
                    width = NULL,
                    height = NULL,
                    just = "centre",
                    vjust = NULL,
                    hjust = NULL,
                    gp = grid::gpar()){
  file_ext <- tools::file_ext(filename)
  FUN <- switch(
    file_ext,
    "png" = png::readPNG,
    "jpg" = jpeg::readJPEG,
    "jpeg" = jpeg::readJPEG,
    print("Only jpg, png and jpeg are allowed")
  )
  grid::rasterGrob(FUN(filename), interpolate = TRUE,
                   x = x, y = y,
                   width = width, height = height,
                   gp = gp, hjust = 0.5, vjust = vjust)
}
