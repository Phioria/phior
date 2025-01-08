#' @title cls
#'
#' @description Provides an quicker alias to clear the Console
#'
#' @examples
#' cls()
#' @export

cls <- function() {
  if (!interactive()) return(NULL)
  os <- .Platform$OS.type
  switch(os,
         'unix'    = system('clear'),
         'windows' = cat("\f"))
}
