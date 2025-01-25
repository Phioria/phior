#' @title setup_reload
#'
#' @description creates a settings file in the users home directory that will be used by reload()
#'
#' @param package_dir A string representing the base directory of the R package in development
#' @param working_dir A string representing the directory you are working in
#'
#' @examples
#' setup_reload(package_dir = "C:/packages/my_package", working_dir = "C:/Analysis/analysis_23")
#' setup_reload(package_dir = file.path(get_home(), "Documents", "Packages", "my_package"), working_dir = file.path(get_desktop(), "my_working_directory"))
#' @export

setup_reload <- function(package_dir, working_dir) {
  # Get CRAN acceptable persistant storage location for config file
  cfg <- tools::R_user_dir(package = "phior", which = "config")

  if (!file.exists(cfg)) {
    stopifnot(dir.create(cfg))
  }

  settings_file <- file.path(cfg, ".reloadr")
  settings <- data.frame(package_dir, working_dir)

  write.table(settings, settings_file, sep = "\t", col.names = FALSE, row.names = FALSE)
}
