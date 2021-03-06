% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/su-hist-file.R
\name{software_update_history}
\alias{software_update_history}
\title{Retrieve Software Update history}
\usage{
software_update_history(
  su_hist_file = "/Library/Receipts/InstallHistory.plist"
)
}
\arguments{
\item{su_hist_file}{path to "Software Update" history file}
}
\description{
Modern macOS "Software Update" history is preserved in the
\verb{/Library/Receipts/InstallHistory.plist} proeprty list file. The default
behaviour is to use this file as a source and parse the property list into
a data frame (tibble). The caller can also provide a path to a valid
property list "Software Update" history file (i.e. a systems administrator
may want to analyze a collected inventory of "Software Update" history files
from all the macOS systems on her network).
}
