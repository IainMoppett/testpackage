
<!-- README.md is generated from README.Rmd. Please edit that file -->

# testpackage

<!-- badges: start -->
<!-- badges: end -->

The goal of testpackage is to provide some helper functions for people
working with HSRC or other projects.

There are currently two independent tools.

`pretty_plot` adds a logo and some text (e.g. source, date etc) to a
plot. `QR_save` generates a series of QR codes from a csv file of URLs
and titles. Useful for presentations.

## Installation

You can install the development version of testpackage from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("IainMoppett/testpackage")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(testpackage)
## basic example code
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
