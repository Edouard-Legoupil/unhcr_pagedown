# unhcrpagedown

<a href="https://github.com/rstudio/pagedown"><img src="https://user-images.githubusercontent.com/163582/51942716-66be4180-23dd-11e9-8dbc-fdb4f465d1c2.png" alt="pagedown logo" align="right" /></a>

Paginate the HTML Output of R Markdown with CSS for Print. You only need a modern web browser (e.g., Google Chrome) to generate PDF. No need to install LaTeX to get beautiful PDFs.

This R package stands on the shoulders of two giants to support typesetting with CSS for R Markdown documents: [Paged.js](https://gitlab.pagedmedia.org/tools/pagedjs) and [ReLaXed](https://github.com/RelaxedJS/ReLaXed) (we only borrowed some CSS from the ReLaXed repo and didn't really use the Node package).

You may install this package from Github:

```r
remotes::install_github('edouard-legoupil/unhcrpagedown')
```

This package requires a recent version of Pandoc (>= 2.2.3). If you use RStudio, you are recommended to install the [latest version](https://rstudio.com/products/rstudio/download/) (>= 1.2.1335), which has bundled Pandoc 2.x, otherwise you need to install Pandoc separately.
