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
  home <- get_home()
  if (!dir.exists(home)) {
    message('Could not locate the home directory')
    return(NULL)
  }

  if (dir.exists(paste(home, "Desktop", sep = "/"))) {
    desktop <- paste(home, "Desktop", sep = "/")
    return(desktop)
  } else if (dir.exists(paste(home, "desktop", sep = "/"))) {
    desktop <- paste(home, "desktop", sep = "/")
    return(desktop)
  }
  # A standard desktop directory wasn't located
  message('Could not locate a Desktop directory')
  return(NULL)
}
