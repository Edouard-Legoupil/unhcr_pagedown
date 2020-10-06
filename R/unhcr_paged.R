#' Create a paged HTML document suitable for printing with UNHCR Brand
#'
#' This output format is similar to \code{\link{html_paged}}.
#' @param ...,css,template,csl,highlight,pandoc_args Arguments passed to \code{\link{html_paged}()}.
#' This is an output format based on \code{bookdown::html_document2} (which
#' means you can use those Markdown features added by \pkg{bookdown}). The HTML
#' output document is split into multiple pages via a JavaScript library
#' \pkg{paged.js}. These pages contain elements commonly seen in PDF documents,
#' such as page numbers and running headers.
#'
#' When a path or an url is passed to the \code{front_cover} or \code{back_cover}
#' argument, several CSS variables are created. They are named \code{--front-cover}
#' and \code{--back-cover} and can be used as value for the CSS property \code{background-image}.
#' For example, \code{background-image: var(--front-cover);}. When a vector of
#' paths or urls is used as a value for \code{front_cover} or \code{back_cover},
#' the CSS variables are suffixed with an index: \code{--front-cover-1},
#' \code{--front-cover-2}, etc.
#'
#' @param ... Arguments passed to
#'   \code{bookdown::\link[bookdown]{html_document2}}.
#' @param css A character vector of CSS file paths. If a path does not contain
#'   the \file{.css} extension, it is assumed to be a built-in CSS file. For
#'   example, \code{default-fonts} means the file
#'   \code{pagedown:::pkg_resource('css', 'default-fonts.css')}. To see all
#'   built-in CSS files, run \code{pagedown:::list_css()}.
#' @param theme The Bootstrap theme. By default, Bootstrap is not used.
#' @param template The path to the Pandoc template to convert Markdown to HTML.
#' @param csl The path of the Citation Style Language (CSL) file used to format
#'   citations and references (see the \href{https://pandoc.org/MANUAL.html#citations}{Pandoc documentation}).
#' @param front_cover,back_cover Paths or urls to image files to be used
#'   as front or back covers. Theses images are available through CSS variables
#'   (see Details).
#' @references \url{https://pagedown.rbind.io}
#' @return An R Markdown output format.
#' @import stats utils
#' @export
#'
#'
unhcr_paged = function(
  ..., css = c('unhcr-fonts', 'unhcr-page', 'unhcr'), theme = NULL,
  template = pkg_resource('html', 'paged.html'), csl = NULL,
  front_cover = NULL, back_cover = NULL
) {
  pagedown::html_format(
    ..., css = css, theme = theme, template = template, .pagedjs = TRUE,
    .pandoc_args = c(
      lua_filters('uri-to-fn.lua', 'loft.lua', 'footnotes.lua'), # uri-to-fn.lua must come before footnotes.lua
      if (!is.null(csl)) c('--csl', csl),
      pandoc_chapter_name_args(),
      pandoc_covers_args(front_cover, back_cover)
    ),
    .dependencies = covers_dependencies(front_cover, back_cover)
  )
}
