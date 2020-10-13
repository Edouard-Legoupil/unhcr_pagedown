# unhcRstyle

A package with all necessary elements to implement UNHCR Brand style: 

 * ggplot2 theme for bar chart, scatter plot, histogram and maps
 
 * a series of color palette
 
 * Rmd output template in Word, Powerpoint and html/bootstrap
 
 * A markdown template built on the top of pagedown
 
 * Markown skeleton to quick-start any report you need to prepare

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
