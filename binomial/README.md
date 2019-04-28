# binomial

The goal of binomial is to easily gain insight on binomially distributed tasks by visual and analytic tools.

## Installation

You can install the released version of binomial from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("binomial")
```

## Example

This is a basic example which shows you how to see common distribution:

``` r
dist <- bin_distribution(100, .5)
plot.bindis(dist)
```

