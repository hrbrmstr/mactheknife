#' Read 'macOS' .DS_Store' Files
#'
#' A set of tools/methods and data that are geared towards the 'macOS' ecosystem.
#'
#' @md
#' @name mactheknife
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @import reticulate sys xml2
#' @importFrom purrr map_df %>% flatten_chr set_names map_chr safely map_lgl
#' @importFrom dplyr case_when src_sqlite
#' @importFrom anytime anytime
#' @importFrom stats complete.cases
#' @importFrom utils compareVersion download.file read.fwf type.convert
#' @import stringi
"_PACKAGE"
