# Define palettes ----

#' Test palette
#'
#' This is a test palette inspired by stop-light colors
#'
#' @references https://en.wikipedia.org/wiki/Traffic_light
#' @name test_pal
NULL

#' @name test_pal
#' @export test_pal
#' @title Define discrete palette
test_pal <- c(
  "#00A850", # green
  "#FEEF01", # yellow
  "#F58222", # orange
  "#E13C29"  # red
)

#' @name test_pal_op
#' @export test_pal_op
#' @title Define opinionated discrete palette (good, neutral, bad)
test_pal_op <- c(test_pal[1], "grey50", test_pal[4])

#' @name test_pal_cont
#' @export test_pal_cont
#' @title Define two colors for endpoints of continuous palette
test_pal_cont <- c(test_pal[1], test_pal[2])

#' @name test_pal_div
#' @export test_pal_div
#' @title Define three colors for endpoints of diverging continuous pallete (high, middle, low)
test_pal_div  <- c(test_pal[1], test_pal[2], test_pal[4])





# Map palettes to different type of scaling ----

#' @title Custom color and fill scales
#'
#' Custom coloring and filling functions based on unique color palettes
#'
#' Specific functions include:
#' \itemize{
#' \item{scale_(color/colour/fill)_discrete_unhcr}{Discrete palette with either fixed or dynamically extended number of shades}
#' \item{scale_(color/colour/fill)_opinionated_unhcr}{Discrete palette with specific values for "good", "bad", and "neutral"}
#' \item{scale_(color/colour/fill)_diverging_unhcr}{Continuous diverging color palette}
#' \item{scale_(color/colour/fill)_continuous_unhcr}{Continuous color palette}
#' }
#'
#' @references https://en.wikipedia.org/wiki/Traffic_light
#' @name scale_custom
#'
#' @param palette Name of color palette
#' @param extend Whether to extend discrete color palette to make sufficient colors for levels needed
#' @param ... Additional arguments to be passed to internal scale function
NULL



# DISCRETE ----

#' @rdname scale_custom
#' @title Discrete palette with either fixed or dynamically extended number of shades
#' @export
scale_color_discrete_unhcr <- function(palette = "test", extend = FALSE, ...){

  pal <- retrieve_palette(palette, "base")
  ggplot2::discrete_scale("colour", "test",
                          manual_pal_flex(pal, extend),
                          na.value = "grey50",
                          ...)

}

#' @rdname scale_custom
#' @export
scale_colour_discrete_unhcr <- scale_color_discrete_unhcr

#' @rdname scale_custom
#' @export
scale_fill_discrete_unhcr <- function(palette = "test", extend = FALSE, ...){

  pal <- retrieve_palette(palette, "base")
  ggplot2::discrete_scale("fill", "test",
                          manual_pal_flex(pal, extend),
                          na.value = "grey50",
                          ...)

}

# OPINIONATED ----

#' @rdname scale_custom
#' @title Discrete palette with specific values for "good", "bad", and "neutral"
#' @export
scale_color_opinionated_unhcr <- function(palette = "test", ...){

  pal <- retrieve_palette(palette, "op")[1:3]
  names(pal) <- c("good", "neutral", "bad")
  ggplot2::scale_color_manual(values = pal, ...)

}

#' @rdname scale_custom
#' @export
scale_colour_opinionated_unhcr <- scale_color_discrete_unhcr

#' @rdname scale_custom
#' @export
scale_fill_opinionated_unhcr <- function(palette = "test", ...){

  pal <- retrieve_palette(palette, "op")[1:3]
  names(pal) <- c("good", "neutral", "bad")
  ggplot2::scale_fill_manual(values = pal, ...)

}

# CONTINUOUS DIVERGING ----

#' @rdname scale_custom
#' @title Continuous diverging color palette
#' @export
scale_color_diverging_unhcr <- function(palette = "test", ...) {

  pal <- retrieve_palette(palette, "div")
  ggplot2::scale_colour_gradient2(low = pal[3],
                                  mid = pal[2],
                                  high = pal[1],
                                  ...)

}

#' @rdname scale_custom
#' @export
scale_colour_diverging_unhcr <- scale_color_diverging_unhcr

#' @rdname scale_custom
#' @export
scale_fill_diverging_unhcr <- function(palette = "test", ...) {

  pal <- retrieve_palette(palette, "div")
  ggplot2::scale_fill_gradient2(low = pal[3],
                                mid = pal[2],
                                high = pal[1],
                                ...)

}

# CONTINUOUS ----

#' @rdname scale_custom
#' @title COntinuous color palette
#' @export
scale_color_continuous_unhcr <- function(palette = "test", ...) {

  pal <- retrieve_palette(palette, "cont")
  ggplot2::scale_colour_gradient(low = pal[1],
                                 high = pal[2],
                                 ...)

}

#' @rdname scale_custom
#' @export
scale_colour_continuous_unhcr <- scale_color_continuous_unhcr

#' @rdname scale_custom
#' @export
scale_fill_continuous_unhcr <- function(palette = "test", ...) {

  pal <- retrieve_palette(palette, "cont")
  ggplot2::scale_fill_gradient(low = pal[1], high = pal[2], ...)

}

# HELPERS ----

#' @rdname get_unhcr_palettes
#' @title Get names of all unique palettes provided in unhcr
#'
#' @param full Whether to include full palette names (with suffixes, e.g. \code{_cont}) or just stubs
#' @return Vector of palette name stubs or full names
#' @export
#'
#' @examples get_unhcr_palettes()

get_unhcr_palettes <- function(full = FALSE){

  re <- if (full) "^.*_pal(_op|_cont|_div)?$" else "^.*_pal$"
  grep(re, getNamespaceExports("unhcRstyle"), value = TRUE)

}

# Create additional colors from palette as needed
#' @keywords internal
manual_pal_flex <- function(values, extend = FALSE){

    force(values)
    function(n) {
      n_values <- length(values)
      if (n > n_values & !extend) {
        warning("This manual palette can handle a maximum of ",
                n_values, " values. You have supplied ", n, ".",
                "Set parameter extend = TRUE if you wish to ",
                "interpolate a broader spectrum of colors.",
                call. = FALSE)
      }
      else if (n > n_values) {
        values <- grDevices::colorRampPalette(values)(n)
      }
      values[seq_len(n)]
    }

}

# Retrieve palette with reasonable defaults upon failure
# Tries for specific request, else tries to default to base, else fails
# Also checks palette length meets fx requirements, else modifies
#' @keywords internal
retrieve_palette <- function(name, type = c("base", "op", "div", "cont")){

  match.arg(type)

  # attempt to get palette requrested
  pal_base <- paste0(name, "_pal")
  pal_name <- if (type == "base") pal_base else paste0(name, "_pal_", type)
  pal <- try(utils::getFromNamespace(pal_name, "unhcRstyle"))

  # if fails, attempt to use base palette
  if (class(pal) == "try-error") {
    pal <- try(utils::getFromNamespace(pal_base, "unhcRstyle"))
  }

  # if base fails, throw error
  if (class(pal) == "try-error") {
    stop("No such palette exists. ",
         "Run get_unhcr_palettes() to see options. ",
         call. = FALSE)
  }

  # if any palette succeeds, validate it is of needed length
  if (length(pal) == 2 & type %in% c("div", "op")) {

    warning("Palette has length of two. ",
            "To use with this scale, it has been modified. ",
            "Inspect your plot to ensure the resulting scale makes sense. ",
            call. = FALSE)

    pal <- c(pal[1], "darkgrey", pal[2])
  }
  if (length(pal) == 1) {

    warning("Palette has length of one. ",
            "Colors will be repeated. ",
            call. = FALSE)

    if (type %in% c("base", "cont")) pal <- c(pal, pal)
    else pal <- c(pal, "darkgrey", pal)

  }

  return(pal)


}
