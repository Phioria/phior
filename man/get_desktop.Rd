% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_desktop.R
\name{get_desktop}
\alias{get_desktop}
\title{get_desktop}
\usage{
get_desktop()
}
\value{
A character object containing the path to the Desktop directory
}
\description{
Finds the path to Desktop directory if on Windows
    for use in conjuction with setting your working directory
}
\examples{
my_desktop <- get_desktop()
}
