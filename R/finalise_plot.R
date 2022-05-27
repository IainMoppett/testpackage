create_footer <- function (source_name, logo_path, fontsize = 16) {
  #Make the footer
  footer <- grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.1, "npc")),
                           grid::textGrob(source_name,
                                          x = 0.01, hjust = 0, gp = grid::gpar(fontsize=fontsize)),
                           get_img(logo_path))
  return(footer)
}

#' Add a logo and text underneath a plot
#'
#' \code{pretty_plot} is a wrapper to place a logo at the bottom right and an optional text at the bottom left.
#' It is intended to give a consistent, 'corporate' feel to figures.
#' It adds an extra margin to the plot at the bottom where the logos and text are placed.
#'
#' @param plot A \code{ggplot} to be amended.
#' @param source_name A character string of text to be added bottom left.
#' @param logo_path Filepath to png or jpg file of logo to be added bottom right.
#' @param text_size Font size for the text. Default is 16
#' @return A plot with text (left) and logo (right)
#'
#' @examples
#' library(ggplot2)
#' pl_1 <- ggplot(mpg, aes(displ, hwy, colour = class)) + geom_point()
#' pl_1_no_legend <- ggplot(mpg, aes(displ, hwy, colour = class)) +
#' geom_point(show.legend = FALSE)
#'
#' pl_1
#' pl_1_no_legend
#'
#' pp_pl_1 <- pretty_plot(pl_1, source = "Text 14 point",
#' logo_path = system.file("extdata", "SNAP3_2019.jpg", package = "testpackage"),
#' text_size = 14)
#'
#' pp_pl_1
#'
#' pp_pl_1_no_legend <- pretty_plot(pl_1, source = "Text 16 point",
#' logo_path = system.file("extdata", "SNAP3_2019.jpg", package = "testpackage"),
#' text_size = 16)
#'
#' pp_pl_1_no_legend

#' @export
pretty_plot <- function(plot, source_name = "", logo_path, text_size = 16) {
  new_footer <- create_footer(source_name, logo_path = logo_path, fontsize = text_size)
  plot <- plot +
    ggplot2::theme_minimal()
  plot_grid <- ggpubr::ggarrange(plot, new_footer,
                                 ncol = 1, nrow = 2,
                                 heights = c(1, 0.07))
}
