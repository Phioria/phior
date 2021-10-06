#' @title clr
#'
#' @description Provides an quicker alias to clear the Environment
#'
#' @examples
#' clr()
#' @export

clr <- function() rm(list=ls(envir=.GlobalEnv), envir=.GlobalEnv)
