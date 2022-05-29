#' Create an HSRC ggplot theme
#'
#' \code{theme_HSRC} is a theme based on theme_minimal. No grid lines, only x and y axis.
#' Horizontal y-axis label
#' Dark grey rather than black for text elements
#' @inheritParams ggplot2::theme_minimal
#'
#' @return A plot with text (left) and logo (right)
#'
#' @examples
#' library(ggplot2)
#' pl_1 <- ggplot(mpg, aes(displ, hwy, colour = class)) + geom_point()
#' pl_1_no_legend <- ggplot(mpg, aes(displ, hwy, colour = class)) +
#' geom_point(show.legend = FALSE)
#'
#' pl_1
#' pl_1 + theme_HSRC()
#' pl_1_no_legend
#' pl_1_no_legend + theme_HSRC()
#'
#' @export
#' @importFrom ggplot2 %+replace%
theme_HSRC <- function(base_size = 18,
                      base_family = "",
                      base_line_size = base_size / 170,
                      base_rect_size = base_size / 170){
  ggplot2::theme_minimal(base_size = base_size,
                base_family = base_family,
                base_line_size = base_line_size) %+replace%
    ggplot2::theme(
      plot.margin = unit(c(1, 0, 1, 0), "cm"),
      plot.title = ggplot2::element_text(
        color = grDevices::rgb(25, 43, 65, maxColorValue = 255),
        face = "bold",
        hjust = 0),
      axis.title = ggplot2::element_text(
        color = grDevices::rgb(105, 105, 105, maxColorValue = 255),
        size = ggplot2::rel(0.75)),
      axis.title.y = ggplot2::element_text(
        angle=0,
        vjust = 1.05,
        margin = ggplot2::margin(t = 30, r = -30, l = 10)),
      axis.text = ggplot2::element_text(
        color = grDevices::rgb(105, 105, 105, maxColorValue = 255),
        size = ggplot2::rel(0.5)),
      axis.line = ggplot2::element_line(
        linetype = "solid"),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      legend.text = ggplot2::element_text(
        size = ggplot2::rel(0.5),
        color = grDevices::rgb(105, 105, 105, maxColorValue = 255),
        hjust = 0),
      legend.title = ggplot2::element_text(
        size = ggplot2::rel(0.75),
        face = "plain",
        color = grDevices::rgb(105, 105, 105, maxColorValue = 255),
        hjust = 0),

      complete = TRUE
    )
}
