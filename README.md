
<!-- README.md is generated from README.Rmd. Please edit that file -->

# phior

<!-- badges: start -->
<!-- badges: end -->

## Overview

phior is a small collection of functions that are useful to me in my day
to day development:

- `clr()` is a short alias to clearing the global environment
- `cls()` clears the console if interactive
- `get_desktop()` returns the system desktop directory if findable
- `get_home()` returns the system home directory
- `reload()` clears the global environment, then documents and reloads
  the R package defined in setup_reload() and then sets the working
  directory
- `setup_reload()` writes a small settings file that stores the
  directories used by reload()
- `setwd_to_file()` sets the working directory to the directory the
  script is saved in

## Installation

You can install the development version of phior from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Phioria/phior")
```
