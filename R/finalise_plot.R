#' Add a logo and text underneath a plot
#'
#' \code{pretty_plot} is a wrapper to place a logo at the bottom right and an optional text at the bottom left.
#' It is intended to give a consistent, 'corporate' feel to figures.
#' It adds an extra margin to the plot at the bottom where the logos and text are placed.
#'
#' @param plot A \code{ggplot} to be amended.
#' @param source A character string of text to be added bottom left.
#' @param logo_path Filepath to png or jpg file of logo to be added bottom right.
#' @param width Size of the frame where text and logo are placed. Default is 4.
#' @param text_size Font size for the text. Default is 16
#' @return A plot with text (left) and logo (right)
#'
#'

#' @export
pretty_plot <- function(plot, source = "", logo_path, width = 4, text_size = 16) {
  logo <- get_img(logo_path,
                  x = unit(1, "npc") - unit(width, "lines"),
                  y = unit(-width/2, "lines"),
                  width = unit(width*1.5, "lines"),
                  vjust = 1)

  texttoadd <- grid::textGrob(source,
                              x = unit(0, "npc"),
                              y = unit(-width/2, "lines"),
                              just = "left", vjust = 0.5,
                              gp = grid::gpar(fontsize=text_size))

  plot +
    ggplot2::theme_light() +
    ggplot2::theme(plot.margin = unit(c(1, 1, width, 1), "lines")) +
    ggplot2::annotation_custom(logo) +
    ggplot2::annotation_custom(texttoadd)
}
