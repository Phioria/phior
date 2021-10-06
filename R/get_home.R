#' @title get_home
#'
#' @description Finds the path to the home directory on any OS
#'
#' @return A character vector containing the path to the Home directory
#'
#' @examples
#' my_home <- get_home()
#' @export

get_home <- function() {
  # Store OS
  os <- .Platform$OS.type
  home <- switch(os,
                 'unix'    = shell('echo ~', intern = TRUE),
                 'windows' = gsub('\\\\', '/', shell('echo %userprofile%', intern = TRUE)))

  # check if exists then, return home, else try a more complicated search?
  #if (!dir.exists(home)) {
  #  home <- more_complicated_get_home_function(home)
  #}
  return(home)
}

