#' @title clr
#'
#' @description Provides an quicker alias to clear the Environment
#'
#' @example
#' clr()
#' @export

clr <- function() rm(list=ls(envir=.GlobalEnv), envir=.GlobalEnv)
