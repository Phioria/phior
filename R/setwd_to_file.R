#' @title setwd_to_file
#'
#' @description Sets the current working directory to the file location
#'              This only works for interactive and files being run directly,
#' @examples
#' setwd_to_file()
#' @export

setwd_to_file <- function() {
  if (interactive()) {
    os <- .Platform$OS.type
    file.directory <- switch(os,
                             'unix'    = system('pwd', intern = TRUE),                          # R
                             'windows' = dirname(rstudioapi::getActiveDocumentContext()$path))  # Rstudio
  } else {
    cArgs <- commandArgs(trailingOnly = FALSE)
    file.directory <- dirname(normalizePath(sub("--file=", "", cArgs[grep("--file=", cArgs)]))) # Rscript
  }
  if (file.directory == "") {
    warning("No active document directory was located.")
    message("This function is intended to be document context dependent.")
    message("If this was run in an unsaved/named file, please save the file and run again.")
    message("If this was run in the console, well, don't do that.")
  } else {
    setwd(file.directory)
  }
}
