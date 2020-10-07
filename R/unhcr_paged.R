#' Create a paged HTML document suitable for printing with UNHCR Brand
#'
#' @param ... Arguments passed to
#'   \code{pagedown::\link[pagedown]{html_paged}}.
#' @references \url{https://pagedown.rbind.io}
#' @return An R Markdown output format.
#' @import stats utils pagedown
#' @export
#'
#'
unhcr_paged = function(...) {
  cssfile <- function(...) { 
    system.file("resources", "css", paste0(..., ".css"), package = "unhcrpagedown")
  }
  
  pagedown::html_paged(
    css = c(cssfile('unhcr-fonts'), cssfile('unhcr-page'), cssfile('unhcr')), 
    ...)
}
