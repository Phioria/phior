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
  os <- .Platform$OS.type
  home <- switch(os,
                 'unix'    = system('echo ~', intern = TRUE),
                 'windows' = gsub('\\\\', '/', shell('echo %userprofile%', intern = TRUE)))

  if (!dir.exists(home)) {
    print("Couldn't find your home directory, boss.")
    return(NULL)
  }
  return(home)
}
