# unhcRstyle

## Content 

A package with all necessary elements to quickly implement [UNHCR Brand style](https://intranet.unhcr.org/content/dam/unhcr/intranet/staff%20support/strategic/documents/english/branded-templates/main/Accessing%20UNHCR%20Brand%20Compliant%20Templates%20user%20guide.pdf) in your statistical products and data stories: 

1. Adjusted [ggplot2 __themes__](https://ggplot2.tidyverse.org/reference/theme.html) for:
   * bar chart,
   * scatter plot,
   * histogram and
   * maps
 
2. A series of [color __palette__](http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/) for: 
 
   * Discrete palette with either fixed or dynamically extended number of shades
   * Discrete palette with specific values for "good", "bad", and "neutral"
   * Continuous diverging color palette
   * Continuous color palette 
 
3. Rmd __output template__ for:
   *  Word,
   *  Powerpoint and 
   *  html/bootstrap
 
4. A __markdown template for paginated report__ built on the top of pagedown. You can see an example through the  [UNHCR R Cookbook](https://edouard-legoupil.github.io/unhcr_pagedown/inst/examples/How_to_quickly_produce_statistical_reports.html)
 
5. and __Markdown skeleton__ to quick-start any report or slides you need to prepare


## Usage 

install this package from Github:

```r
remotes::install_github('edouard-legoupil/unhcr_pagedown')
```

This package requires a recent version of Pandoc (>= 2.2.3). If you use RStudio, you are recommended to install the [latest version](https://rstudio.com/products/rstudio/download/) (>= 1.2.1335), which has bundled Pandoc 2.x, otherwise you need to install Pandoc separately.


#### Building package documentation 

`devtools::document()`

`devtools::check(document = FALSE)`

`pkgdown::build_site()`


If you encounter a clear bug, please file a minimal reproducible example on [github](https://github.com/edouard-legoupil/unhcr_pagedown/issues). 
