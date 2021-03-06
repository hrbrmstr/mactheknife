% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/system-profile.R
\name{system_profile}
\alias{system_profile}
\title{Report system hardware and software configuration}
\usage{
system_profile(detail_level = c("mini", "basic", "full"))
}
\arguments{
\item{detail_level}{how much information to return:
\itemize{
\item \code{mini} report with no personal information
\item \code{basic} basic hardware and network information
\item \code{full} all available information
}}
}
\description{
TODO Do more than just return an xml document once a generic plist reader
is created.
}
\note{
Even the \code{mini} option takes a noticeable amount of time to complete.
}
