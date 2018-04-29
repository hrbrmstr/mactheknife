#' Retrieve macOS Operating System Version Information
#'
#' @return data frame (tibble)
#' @export
sw_vers <- function() {

  res <- sys::exec_internal("sw_vers")

  if (length(res$stdout) == 0) {
    stop('Error retrieving macOS version info. Are you running on macOS?', call.=FALSE)
  }

  out <- rawToChar(res$stdout)
  purrr::map_dfc(strsplit(out, "\n")[[1]], ~{
    .x <- strsplit(.x, "\t")[[1]]
    as.list(purrr::set_names(.x[2], gsub(":", "", .x[1])))
  })

}