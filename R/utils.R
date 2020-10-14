# locations of resource files in the package
pkg_resource <- function(...) {
  system.file(..., package = "unhcrstyle")
}


#' @name left_align
#' @rdname left_align
#' @title Left align text for title in ggplot2 object
#' @description Left align text
#'
#'
#' @param  plot_name
#' @param  pieces
#'
#' @return ggplot2 object with aligned title
#'
#' @author https://github.com/bbc/bbplot/blob/master/R/finalise_plot.R
#'
#' @examples
#' \dontrun{
#' ggpubr::ggarrange(left_align(plot1, c("subtitle", "title", "caption")), ncol = 1, nrow = 1)
#' }
#'
#' @export left_align

left_align <- function(plot_name, pieces){
  grob <- ggplot2::ggplotGrob(plot_name)
  n <- length(pieces)
  grob$layout$l[grob$layout$name %in% pieces] <- 2
  return(grob)
}

#' @name format_si
#' @rdname format_si
#' @title Format axis label
#' @description Helper function to format a vector of strings using
#'   SI prefix notation
#'
#'
#'
#' Format a vector of numeric values according
#' to the International System of Units.
#' http://en.wikipedia.org/wiki/SI_prefix
#'
#' Based on code by Ben Tupper
#' https://stat.ethz.ch/pipermail/r-help/2012-January/299804.html
#' Args:
#'
#'
#' @param \dots List of integer or numeric
#'   ...: Args passed to format()
#'
#' @return Formatted number.
#'
#' @author Someone
#'
#' @examples
#' format_si()
#'
#' @export format_si
#'
## a little help function to better format numbers
format_si <- function(...) {
  function(x) {
    limits <- c(1e-24, 1e-21, 1e-18, 1e-15, 1e-12,
                1e-9,  1e-6,  1e-3,  1e0,   1e3,
                1e6,   1e9,   1e12,  1e15,  1e18,
                1e21,  1e24)
    prefix <- c("y",   "z",   "a",   "f",   "p",
                "n",   "",   "m",   " ",   "k",
                "M",   "G",   "T",   "P",   "E",
                "Z",   "Y")

    # Vector with array indices according to position in intervals
    i <- findInterval(abs(x), limits)

    # Set prefix to " " for very small values < 1e-24
    i <- ifelse(i == 0, which(limits == 1e0), i)

    paste(format(round(x/limits[i], 1),
                 trim = TRUE, scientific = FALSE, ...),
          prefix[i])
  }
}
