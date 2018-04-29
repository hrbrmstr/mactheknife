#' Retrieve kernel state information
#'
#' @export
kernel_state <- function() {

  res <- sys::exec_internal("sysctl", "-a")

  if (res$status != 0) {
    stop("Error retrieving kernel state info. Are you on macOS?", call.=FALSE)
  }

  out <- rawToChar(res$stdout)
  purrr::map_df(strsplit(out, "\n")[[1]], ~{
    .x <- strsplit(.x, ": ", fixed = TRUE)[[1]]
    list(
      setting = .x[1],
      value = .x[2]
    )
  })


}