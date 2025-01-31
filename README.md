
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

## Usage

### Package Development

- `reload(clear_env = TRUE)` is simply a wrapper around
  `devtools::load_all()` and `Rcpp::compileAttributes()`. When making
  changes to a package that uses both R and Rcpp, it became tedious to
  clear the environment, set the working directory to the package
  directory, run `compileAttributes()`, `document()`, `load_all()`, and
  then change back to the directory I was previously working in. This
  does that all in one step. In order to work, `setup_reload()` needs to
  be run once in order to save your package and working directories. By
  default, `reload()` clears the global environment, but this can be
  disabled with the parameter `clear_env = FALSE`. `reload()` quietly
  assumes it should run `compileAttributes()` if Rcpp is installed. If
  the package isn’t using Rcpp, it just returns FALSE with no changes
  made.
- `setup_reload(package_dir, working_dir)` creates a one line text file
  called .reloader in the user’s home directory. This stores the package
  and working directories currently being used for `reload()`. If you
  start working on a different package, or you change the directory
  you’re testing/working in, you will need to run `setup_reload()`
  again.
