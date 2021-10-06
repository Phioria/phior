#' @title get_desktop
#'
#' @description Finds the path to Desktop directory if on Windows
#'     for use in conjuction with setting your working directory
#'
#' @return A character object containing the path to the Desktop directory
#'
#' @examples
#' my_desktop <- get_desktop()
#' @export

get_desktop <- function() {
  # Guardrail the OS and make alternate suggestions
  #if (tolower(Sys.info()['sysname']) != 'windows') {
  #  print("You appear to be on a non-Windows machine")
  #  print("Consider running phior::get_home() instead")
  #  return()
  #}
  home <- get_home()
  # make sure home diretory exists?

  if (dir.exists(paste(home, "Desktop", sep = "/"))) {
    desktop <- paste(home, "Desktop", sep = "/")
  } else if (dir.exists(paste(home, "desktop", sep = "/"))) {
    desktop <- paste(home, "desktop", sep = "/")
  }
  return(desktop)

  #perhaps if desktop doesn't exist make 2 suggestions,
  #1. might be on a unix machine without a desktop
  #2. might have a custom desktop name
  #perhaps provide an optional custom directory name for Desktop
}
