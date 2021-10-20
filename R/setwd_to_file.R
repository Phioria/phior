#' @title setwd_to_file
#'
#' @description Sets the current working directory to the file location
#'              This only works for interactive and files being run directly,
#' @examples
#' setwd_to_file
#' @export

setwd_to_file <- function() {
  if (interactive()) {
    os <- .Platform$OS.type
    file.directory <- switch(os,
                             'unix'    = system('pwd', intern = TRUE),                          # R
                             'windows' = dirname(rstudioapi::getActiveDocumentContext()$path))  # Rstudio
  } else {
    cArgs <- commandArgs(trailingOnly = FALSE)
    file.directory <- normalizePath(sub("--file=", "", cArgs[grep("--file=", cArgs)]))                                               # Rscript
  }
  setwd(file.directory)
}

