# unhcRstyle

A package with all necessary elements to implement UNHCR Brand style: 

 1. Adjusted [ggplot2 __themes__](https://ggplot2.tidyverse.org/reference/theme.html) for:
   * bar chart,
   * scatter plot,
   * histogram and
   * maps
 
 2. A series of color palette for: 
 
   * Discrete palette with either fixed or dynamically extended number of shades
   * Discrete palette with specific values for "good", "bad", and "neutral"
   * Continuous diverging color palette
   * Continuous color palette 
 
 3. Rmd output template
   *  Word,
   *  Powerpoint and 
   *  html/bootstrap
 
 4. A markdown template built on the top of pagedown. You can see an example [here](inst/examples/How_to_quickly_produce_statistical_reports.html)
 
 * Markdown skeleton to quick-start any report or slides you need to prepare

install this package from Github:

```r
remotes::install_github('edouard-legoupil/unhcr_pagedown')
```

This package requires a recent version of Pandoc (>= 2.2.3). If you use RStudio, you are recommended to install the [latest version](https://rstudio.com/products/rstudio/download/) (>= 1.2.1335), which has bundled Pandoc 2.x, otherwise you need to install Pandoc separately.


#### Building package documentation 

`devtools::document()`

`devtools::check(document = FALSE)`

`pkgdown::build_site()`


If you encounter a clear bug, please file a minimal reproducible example on [github](https://github.com/unhcr/HighFrequencyChecks/issues). 
