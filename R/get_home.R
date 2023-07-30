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
  # Need to test this on multiple OS and platforms (Rstudio, Rscript, Interactive R)
  # Current list of tests
  # Windows - Rstudio - PASSED
  # Windows - Interactive - NOT TESTED
  # Windows - WSL Linux Rscript - NOT TESTED
  # Windows - WSL Linus Interactive - NOT TESTED
  # LINUX - Rscript - NOT TESTED
  # LINUX - Interactive - NOT TESTED
  # UNIX - Rscript - NOT TESTED
  # UNIX - Interactive - NOT TESTED
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
