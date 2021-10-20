#' @title setwd_to_file
#'
#' @description Sets the current working directory to the file location
#'
#' @examples
#' setwd_to_file
#' @export

setwd_to_file <- function() {
  #if (!interactive())
  # Add in functionality for non Rstudio
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
}
