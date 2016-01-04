# colormod

[![Travis-CI Build Status](https://travis-ci.org/briandconnelly/colormod.svg?branch=master)](https://travis-ci.org/briandconnelly/colormod)
[![Coverage Status](https://img.shields.io/codecov/c/github/briandconnelly/colormod/master.svg)](https://codecov.io/github/briandconnelly/colormod?branch=master)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/colormod)](http://cran.r-project.org/package=colormod)

**Doing some serious re-arranging right now, so I wouldn't recommend trying this package just yet.**

Colormod makes manipulating colors easy.

Inspired by tools like [Sass](http://sass-lang.com) and [Less](http://lesscss.org), colormod provides wrappers using [colorspace](http://cran.r-project.org/web/packages/colorspace/index.html) to convert, extract, and manipulate individual properties of colors. For portability, colormod primarily works with and produces colors as hexadecimal strings (although R's named colors are also supported).

Let's say you wanted to make your <span style="background-color: #8c613f;">orange</span> both <span style="background-color: #8C5123;">richer</span> (more saturated) and also a little <span style="background-color: #D97D36;">brighter</span>:

```r
"#8c613f" %>% saturate(0.2) %>% lighten(0.3)
```

Or, you could convert that <span style="background-color: #8c613f;">orange</span> to <span style="background-color: #8C8C8C;">greyscale</span>: 

```r
greyscale("#8c613f")
```


## Installing 
This package is not quite ready to be available on [CRAN](http://cran.r-project.org), but you can use [devtools](http://cran.r-project.org/web/packages/devtools/index.html) to install the current development version:

    devtools::install_github("briandconnelly/colormod")

