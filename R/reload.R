#' @title reload
#'
#' @description Clears the environment and reloads the current package
#'
#' @param clear_env Set to FALSE if you don't want the environment cleared. Defaults to TRUE
#' @param use_rcpp Set to FALSE if you're not using Rcpp. Defaults to TRUE
#'
#' @examples
#' reload()
#' reload(clear_env = FALSE)
#' reload(use_rcpp = FALSE)
#' reload(clear_env = FALSE, use_rcpp = FALSE)
#' @export

reload <- function(clear_env = TRUE) {
  if ('devtools' %in% installed.packages() == FALSE) {
    message("The package 'devtools' is missing.")
    message("Please install it before continuing.")
  }

  # Clear the environment
  if (clear_env) {
    clr()
  }

  cfg <- tools::R_user_dir(package = "phior", which = "config")

  settings_file <- file.path(cfg, ".reloadr")
  if (!file.exists(settings_file)) {
    message("Could not locate the reload settings file.")
    message("Run setup_reload() to create this file.")
    return(NULL)
  }

  settings <- read.delim(settings_file, header = FALSE)

  if (ncol(settings) != 2 && nrow(settings) != 1) {
    message("The reload settings file is malformed.")
    message("Run setup_reload() to overwrite the existing file.")
    return(NULL)
  }

  colnames(settings) <- c("package_dir", "working_dir")

  if (!dir.exists(settings$package_dir)) {
    message(paste("The package directory:", settings$package_dir, "doesn't exist."))
    return(NULL)
  }

  if (!dir.exists(settings$working_dir)) {
    message(paste("The working directory:", settings$working_dir, "doesn't exist."))
    return(NULL)
  }

  # Now that all the guardrails have been passed
  setwd(settings$package_dir)

  if ('Rcpp' %in% installed.packages()) {
    Rcpp::compileAttributes(verbose = getOption("verbose"))
  }
  devtools::document()
  #devtools::build_readme()
  devtools::load_all()

  setwd(settings$working_dir)
}
